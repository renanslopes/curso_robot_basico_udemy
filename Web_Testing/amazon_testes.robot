*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Sobre a Amazon"
    [Documentation]    Este teste verificar o menu Eletrônicos do site Amazon.com.br
    ...                e verifica a categoria Computadores e Informática
    [Tags]            menus  categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Sobre a Amazon"
    Verificar a existência da frase "O que significa Amazon? Veja curiosidades sobre a Amazon"
    Verificar se o título da página é igual à "About Amazon Brasil - About Amazon Brasil"
    Verificar se aparece o item "O Que Fazemos"
Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Este teste verifica a busca de um produto
    [Tags]             busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series X" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto "Console Xbox Series X"