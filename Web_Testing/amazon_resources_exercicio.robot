*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                       http://www.amazon.com.br
${MENU_TODOS}                //span[@class='hm-icon-label'][contains(.,'Todos')]
${SEARCH_FIELD}            //input[contains(@type,'text')]
${SEARCH_BUTTON}            //input[contains(@type,'submit')]
${BUTTON_ADD_CART}            //input[contains(@name,'submit.add-to-cart')]
${BUTTON_NOT_WARRANTY}        //input[@aria-labelledby='attachSiNoCoverage-announce']
${BUTTON_CART}                //span[contains(@class,'nav-cart-icon nav-sprite')]
${TITLE}                        Carrinho de compras da Amazon.com
${BUTTON_DELETE}               //input[contains(@data-action,'delete-active')]
${NO_BALANCE}                   R$ 0,00

*** Keywords ***
Abrir o navegador
    Open Browser    browser=firefox
    Maximize Browser Window
    
Fechar o navegador 
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_TODOS}
Digitar o nome de produto "${TEXT_SEARCH}" no campo de pesquisa
    Input Text    locator=${SEARCH_FIELD}    text=${TEXT_SEARCH}
Clicar no botão de pesquisa
    Click Button    locator=${SEARCH_BUTTON}
Verificar o resultado da pesquisa se está listando o produto "${TEXT_SEARCH_RESULT}"
    Wait Until Page Contains    text=${TEXT_SEARCH_RESULT}
Adicionar o produto "${SEARCH_IMAGE_RESULT}" no carrinho
    Click Image    locator=${SEARCH_IMAGE_RESULT}
    Click Element    locator=${BUTTON_ADD_CART}

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Click Element    locator=${BUTTON_CART}
    Title Should Be    title=${TITLE}

Remover o produto "Console Xbox Series S" do carrinho
    Click Element    locator=${BUTTON_CART}
    Click Element    locator=${BUTTON_DELETE}

Verificar se o carrinho fica vazio
    Wait Until Page Contains    text=${NO_BALANCE} 