# RedePOS

### Importante:
#### cpf, cep, phone, não estão sendo completamente validados, porém devidamente formatados.
#### Na HomeSreen é possível "adicionar" ou "remover" do carrinho, endpoin /setvalue e /remvalue porém o recurso não foi feito por completo, apenas adiciona e remove dados enviando os devidos POST sem efeitos visuais no aplicativo.
#### Na UserScreen o POST /getalldata é utilizado, para criar ou atualizar os dados.
#### LoginScreen e SignupScreen utilizam os POST, /login e /signup respectivamente.


## Estrutura dos arquivos:
- path/helpers - extensions.dart Arquivo que conte todas as validações e "regex".
- path/model - converte dados(json) em conceitos(dart) para aplicação.
- path/repositories - Comunicação com API, em caso de mudança do backend da API, este é o único arquivo que precisa de alteração, não a nenhuma logica de negócio ele unicamente consome e entrega os dados.
- path/screens - todas as telas.
- path/stores - todas as logicas de negócio(mobx e provider), UserStore é uma instancia única em todo app utilizando o provider.
- path/widgets - Widgets utilizado em varias telas simultaneamente.

### Bibliotecas:
- http: ^0.13.3  - Este pacote para consumo de recursos HTTP.

- mobx: ^2.0.3 - Biblioteca de gerenciamento de estado.

- flutter_mobx: ^2.0.1 - Fornece o Observerwidget que escuta os observáveis e reconstrói automaticamente nas mudanças.

- brasil_fields: ^1.1.3 - Biblioteca que facilita utilizar campos com os padrões e formatos brasileiros.

- flutter_speed_dial: ^4.2.0 - Widget construído para fornecer alguns recursos visuais para o Scaffold.

- provider: ^5.0.0 - Permite o compartilhamento de uma mesma instância em diferentes telas criando subclasses de widget e auxiliando o gerenciamento de estado.

## Campos de validação:

### Senha:
 - "/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"/^
 
  - (?=.*\d) // deve conter ao menos um dígito
  
  - (?=.*[a-z]) // deve conter ao menos uma letra minúscula
  
  - (?=.*[A-Z])  // deve conter ao menos uma letra maiúscula
  
  - [a-zA-Z\d]{8,}$  // deve conter ao menos 8 dos caracteres
  


### Email:

- "^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$

- [^@]+: um ou mais caracteres que não são @

- @: o próprio caractere "arroba"

- [^_.]* // zero ou mais caracteres que não são _ nem . (garantindo que só vou pegar os __ antes do primeiro ponto)

- __ // dois caracteres _ seguidos 

- [^.]* // zero ou mais caracteres que não são .

- \..* // o próprio caractere ponto (\.) seguido de "qualquer coisa" (.*)

- $ // final da string







 
