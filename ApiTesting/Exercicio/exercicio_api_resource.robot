*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections


*** Keywords ***
Criar um novo usuário
    ${email_aleatorio}  Generate Random String  length=6  chars=[LETTERS]
    ${email_aleatorio}  Convert To Lower Case   ${email_aleatorio}
    Set Test Variable     ${email_teste}  ${email_aleatorio}@emailteste.com
    Log To Console    message=Email criado ${email_teste}

Criar Sessão na ServeRest
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
    Create Session    alias=ServeRest    url=http://localhost:3000   headers=${headers}

Cadastrar o usuário criado na ServeRest
    [Arguments]  ${email}  ${status_code}
    ${body}  Create Dictionary
    ...      nome=Fulano do Teste
    ...      email=${email}
    ...      password=1234
    ...      administrador=true   
    Log   ${body}
    
    Criar Sessão na ServeRest

    ${resposta}  POST On Session
    ...          alias=ServeRest
    ...          url=/usuarios/
    ...          json=${body}
    ...          expected_status=${status_code}

    Log  ${resposta.json()}
    
    IF  ${resposta.status_code} == 201
        Set Test Variable    ${ID_USUARIO}  ${resposta.json()["_id"]}
    END

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Realizar login com o usuário
    Set Test Variable     ${status_code_login}    200
    ${body_login}    Create Dictionary    email=${email_teste}    password=1234
    ${resposta_login}  POST On Session
        ...           alias=ServeRest
        ...           url=/login
        ...           json=${body_login}
        ...           expected_status=${status_code_login}

    Log To Console    message=${resposta_login}
    Log    message=${resposta_login}

    Set Test Variable    ${RESPOSTA}    ${resposta_login.json()}

Verificar se o login ocorreu com sucesso
    Dictionary Should Contain Item    ${RESPOSTA}    message    Login realizado com sucesso
