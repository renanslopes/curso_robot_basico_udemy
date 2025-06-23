*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
# Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Sobre a Amazon"
    [Documentation]    Este teste verificar o menu Eletrônicos do site Amazon.com.br
    ...                e verifica a categoria Computadores e Informática
    [Tags]            menus  categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Sobre a Amazon"
    E verificar a frase "O que significa Amazon? Veja curiosidades sobre a Amazon"
    Entao verificar se o título da página é igual à "About Amazon Brasil - About Amazon Brasil"
    E verificar se aparece o item "O Que Fazemos"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Este teste verifica a busca de um produto
    [Tags]             busca_produtos  lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    # Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
