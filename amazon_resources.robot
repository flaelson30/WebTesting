*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}                   chrome
${URL}                       https://www.amazon.com.br/
${MENU_ELETRONICOS}          //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
# ${TEXTO_ELETRONICOS}         Eletrônicos e Tecnologia
        
*** Keywords ***

Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
     Go To    url=${URL}
     Wait Until Element Is Visible    ${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    ${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains           text=${FRASE}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
     Element Should Be Visible    locator=//span[@class='a-size-base-plus'][contains(.,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${NOME_PRODUTO}
#  ID    

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button   

Verificar o resultado da pesquisa listando o produto "${NOME_PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${NOME_PRODUTO}')])[3]

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    name=submit.addToCart

Verificar se o produto "Console Xbox Series S" foi adicionado ao carrinho com sucesso
    Execute JavaScript               window.scrollTo(0, 0)
    Wait Until Element Is Visible    id=nav-cart    timeout=10s
    Wait Until Element Is Enabled    id=nav-cart    timeout=10s
    Click Element                    id=nav-cart
    Wait Until Page Contains         Microsoft Xbox Series S    timeout=10s

Remover o produto "Console Xbox Series S" do carrinho
    Wait Until Element Is Visible    xpath=//input[starts-with(@name,'submit.delete-active.')]    timeout=10s
    Click Element                    xpath=//input[starts-with(@name,'submit.delete-active.')]

Verificar se o produto "Console Xbox Series S" foi removido do carrinho com sucesso
    Wait Until Element Is Visible    xpath=//*[starts-with(@id,'sc-list-item-removed-msg-text-delete-')]    timeout=10s

# BDD

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"

E o texto "${FRASE}" deve ser exibido na página
    Verificar se aparece a frase "${FRASE}"
    
E a categoria "${NOME_CATEGORIA}" deve ser exibida na página
    Verificar se aparece a categoria "${NOME_CATEGORIA}"

Quando pesquisar pelo produto "${NOME_PRODUTO}"
    Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa

E um produto da linha "${NOME_PRODUTO}" deve ser mostrado na página
    Verificar o resultado da pesquisa listando o produto "${NOME_PRODUTO}"