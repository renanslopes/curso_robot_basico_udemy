*** Settings ***
Library    SeleniumLibrary
Resource         amazon_resources_exercicio.robot

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
Dado que Acesse a home page do site Amazon.com.br
    Acessar a home page do site Amazon.com.br
Quando buscar o produto "${TEXT_SEARCH}"
    Digitar o nome de produto "${TEXT_SEARCH}" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "${TEXT_SEARCH}"
Entao adicionar o produto "${SEARCH_IMAGE_RESULT}" no carrinho
    Adicionar o produto "${SEARCH_IMAGE_RESULT}" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E limpar o carrinho
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio
