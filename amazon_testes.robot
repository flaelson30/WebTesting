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
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Video Games"

Caso de Teste 02 - Pesquisa de um produto específico
    [Documentation]  Este teste verifica a pesquisa de um produto específico no site da amazom.com.br
    [Tags]           busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa listando o produto "Console Xbox Series S"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]  Este teste verifica a adição de um produto no carrinho de compras do site da amazom.com.br
    [Tags]           carrinho  adicionar_produto
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado ao carrinho com sucesso

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]  Este teste verifica a remoção de um produto do carrinho de compras do site da amazom.com.br
    [Tags]           carrinho  remover_produto
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado ao carrinho com sucesso
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o produto "Console Xbox Series S" foi removido do carrinho com sucesso



    