#language:pt
@cadastro_geral      @all_feature
Funcionalidade: Cadastro de usuário

    @user_dinamico
    Cenario: Cadastrando usuário com dados dinamicos
        Dado que o usuario acesse o site
        Quando ele preencher dados dinamicos
        Então ele acessa a home do site

    @user_fixo
    Cenario: Cadastrando usuário fixo
        Dado que o usuario acesse o site
        Quando ele informar dados fixos
        Então ele acessa a home do site