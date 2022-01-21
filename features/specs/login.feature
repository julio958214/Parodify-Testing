#language:pt
    @login
    Funcionalidade: Login
        @login
        Esquema do Cenário: Possibilidades de login
        
            Dado que o usuario acesse a pagina de login
            Quando ele submeter seu login com:
            | email  | <email>  |
            | passwd | <passwd> |
            Então ele visualzia a mensagem: "<msg_saida>"

            Exemplos:
            | email                       |   passwd       |  msg_saida                         |
            | testerqaparodify@gmail.com  |   teste123     |  Recomendadas                      |
            | testerqaparodify@gmail.3223 |   teste123w    |  Oops! Email e/ou senha incorretos.|