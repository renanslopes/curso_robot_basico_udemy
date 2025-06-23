*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                    http://www.amazon.com.br
${MENU_SOBRE}            //a[contains(.,'Sobre a Amazon')]
${MENU_QUEM_SOMOS}       (//a[@class='NavigationItem-text-link'][contains(.,'Quem Somos')])[2]
${TEXTO_TITULO_SOBRE}      O que significa Amazon? Veja curiosidades sobre a Amazon
${TITULO_SOBRE}        //span[contains(.,'O que significa Amazon? Veja curiosidades sobre a Amazon')]
${BOTAO_SEARCH}        nav-search-submit-button

*** Keywords ***
Abrir o navegador
    Open Browser    browser=firefox
    Maximize Browser Window
    
Fechar o navegador 
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_SOBRE}

Entrar no menu "Sobre a Amazon"
    Click Element    locator=${MENU_SOBRE}

Verificar a existência da frase "O que significa Amazon? Veja curiosidades sobre a Amazon"
    Wait Until Page Contains    text=${TEXTO_TITULO_SOBRE}
    Wait Until Element Is Visible    locator=${TITULO_SOBRE}

Verificar se o título da página é igual à "${TITULO_PAGINA_SPBRE}"
    Title Should Be    title=${TITULO_PAGINA_SPBRE}

Verificar se aparece o item "${MENU_O_QUE_FAZEMOS}"
    Element Should Be Visible    locator=(//a[@class='NavigationItem-text-link'][contains(.,'${MENU_O_QUE_FAZEMOS}')])[2]
    
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Button    locator=${BOTAO_SEARCH}

Verificar o resultado da pesquisa, listando o produto "${RESULTADO_BUSCA}"
    Wait Until Page Contains    text=${RESULTADO_BUSCA}



# GHERKIN STEPS
#CT1
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
Quando acessar o menu "Sobre a Amazon"
    Entrar no menu "Sobre a Amazon"
 E verificar a frase "O que significa Amazon? Veja curiosidades sobre a Amazon"
    Verificar a existência da frase "O que significa Amazon? Veja curiosidades sobre a Amazon"
Entao verificar se o título da página é igual à "About Amazon Brasil - About Amazon Brasil"
    Verificar se o título da página é igual à "About Amazon Brasil - About Amazon Brasil"
E verificar se aparece o item "O Que Fazemos"
    Verificar se aparece o item "O Que Fazemos"


#CT2
Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series X" no campo de pesquisa
    Clicar no botão de pesquisa
# Então o título da página deve ficar "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, listando o produto "Console Xbox Series X"