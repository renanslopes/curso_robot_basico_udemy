*** Settings ***
Resource  exercicio_api_resource.robot

*** Test Cases ***
Cenário 04 - Logar com usuário criado
    Criar um novo usuário
    Cadastrar o usuário criado na ServeRest    email=${email_teste}    status_code=201
    Realizar login com o usuário
    # Verificar se o login ocorreu com sucesso