*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_resources_exercicio_gherkin.robot
Resource         amazon_resources_exercicio.robot
Test Setup       Abrir o navegador
# Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que Acesse a home page do site Amazon.com.br
    Quando buscar o produto "Xbox Series S"
    Entao adicionar o produto "Console Xbox Series S" no carrinho
    

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que Acesse a home page do site Amazon.com.br
    Quando buscar o produto "Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Entao adicionar o produto "Console Xbox Series S" no carrinho
    E limpar o carrinho  