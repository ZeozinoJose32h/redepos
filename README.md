# RedePOS

## Leia:

- path/helpers - extensions.dart Arquivo que conte todas as validaçoes e "regex"
- path/model - converte dados(json) em conceitos(dart) para aplicação
- path/repositories - Comunicação com API, em caso de mudança do backend da api, este é o unico arquivo que precisa de alteração.
- path/screens - todas as telas
- path/stores - todas as logicas de negocio(mobx e provider)
- path/widgets - Widgets utilizado em varias telas simuntaniamente 

### bibliotecas:
- http: ^0.13.3  

- mobx: ^2.0.3

- flutter_mobx: ^2.0.1

- brasil_fields: ^1.1.3

- flutter_speed_dial: ^4.2.0

- provider: ^5.0.0

## Campos de validação:

### Senha:
 - "/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"/^
 
  - (?=.*\d) // deve conter ao menos um dígito
  
  - (?=.*[a-z]) // deve conter ao menos uma letra minúscula
  
  - (?=.*[A-Z])  // deve conter ao menos uma letra maiúscula
  
  - [a-zA-Z\d]{8,}$  // deve conter ao menos 8 dos caracteres
  


### email:

- "^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$

- [^@]+: um ou mais caracteres que não são @

- @: o próprio caractere "arroba"

- [^_.]* // zero ou mais caracteres que não são _ nem . (garantindo que só vou pegar os __ antes do primeiro ponto)

- __ // dois caracteres _ seguidos (que também pode trocar por _{2}, se achar que fica mais legível)

- [^.]* // zero ou mais caracteres que não são .

- \..* // o próprio caractere ponto (\.) seguido de "qualquer coisa" (.*)

- $ // final da string

#### cpf, cep,phone, não estão sendo completamente validados, apenas formatados.





 
