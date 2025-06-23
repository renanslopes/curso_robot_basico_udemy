*** Settings ***
Documentation   Prática de Keywords com argumentos
Library    String

*** Variables ***
&{PESSOA}    nome=Renan    sobreNome=Lopes    emailComplemento=@testerobot.com


*** Test Cases ***
Caso de teste 01
    ${MENSAGEM_FINAL}    Keyword 01    ${PESSOA.nome}    ${PESSOA.sobreNome}    ${PESSOA.emailComplemento} 

*** Keywords ***
Keyword 01
    [Arguments]    ${NOME_USUARIO}    ${SOBRENOME_USUARIO}    ${COMPLEMENTO_EMAIL}
    ${COMPLEMENTO_RANDOMICO}    Generate Random String    5    [LETTERS]
    ${MENSAGEM}    Set Variable    O email gerado randomicamente é: ${NOME_USUARIO} ${SOBRENOME_USUARIO} ${COMPLEMENTO_RANDOMICO}${COMPLEMENTO_EMAIL}
    Log To Console    message=${MENSAGEM}
    RETURN    ${MENSAGEM}

