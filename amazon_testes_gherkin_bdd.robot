*** Settings ***
Documentation     Essa suite testa o site da Amazom.com.br
Resource          amazon_resources.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador

*** Test Cases ***   

Caso de Teste 01 - Acesso ao menu Eletrônicos
    [Documentation]  Este teste verifica o menu eletrônico do site da amazom.com.br
    ...              E verifica a categoria coomputadores e informática
    [Tags]           menus  categorias  eletrônicos
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página

Caso de Teste 02 - Pesquisa de um produto específico
    [Documentation]  Este teste verifica a pesquisa de um produto específico no site da amazom.com.br
    [Tags]           busca_produtos  lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]  Verifica a adição de um produto ao carrinho da Amazon.com.br
    [Tags]           carrinho  adicionar_produto
    Given Acessar a home page do site Amazon.com.br
    When Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    And Clicar no botão de pesquisa
    And Verificar o resultado da pesquisa listando o produto "Console Xbox Series S"
    And Adicionar o produto "Console Xbox Series S" no carrinho
    Then Verificar se o produto "Console Xbox Series S" foi adicionado ao carrinho com sucesso

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]  Verifica a remoção de um produto do carrinho da Amazon.com.br
    [Tags]           carrinho  remover_produto
    Given Acessar a home page do site Amazon.com.br
    When Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    And Clicar no botão de pesquisa
    And Verificar o resultado da pesquisa listando o produto "Console Xbox Series S"
    And Adicionar o produto "Console Xbox Series S" no carrinho
    And Verificar se o produto "Console Xbox Series S" foi adicionado ao carrinho com sucesso
    When Remover o produto "Console Xbox Series S" do carrinho
    Then Verificar se o produto "Console Xbox Series S" foi removido do carrinho com sucesso
    