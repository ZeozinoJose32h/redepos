import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:redepos/screens/login_screen.dart';
import 'package:redepos/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignUpStore singUpStore = SignUpStore();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(child: Observer(builder: (_) {
        return Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Crie sua conta",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nome:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextField(
                            enabled: !singUpStore.loading,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                errorText: singUpStore.nameError,
                                border: InputBorder.none,
                                hintText: "Nome"),
                            onChanged: (text) {
                              singUpStore.setName(text);
                            },
                          )),
                      Text(
                        'Email:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                enabled: !singUpStore.loading,
                                errorText: singUpStore.emailError,
                                border: InputBorder.none,
                                hintText: "Email"),
                            onChanged: singUpStore.setEmail,
                          )),
                      Text(
                        'Senha:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextField(
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                enabled: !singUpStore.loading,
                                errorText: singUpStore.pass1Error,
                                border: InputBorder.none,
                                hintText: "Senha"),
                            onChanged: singUpStore.setPass1,
                          )),
                      Text(
                        '*Mínimo de oito caracteres\n'
                        '*Pelo menos uma letra maiúscula\n '
                        '*Uma letra minúscula e um número\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      Text(
                        'Confirmar senha:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextField(
                            obscureText: true,
                            enabled: !singUpStore.loading,
                            decoration: InputDecoration(
                                errorText: singUpStore.pass2Error,
                                border: InputBorder.none,
                                hintText: "Confirmar Senha"),
                            onChanged: singUpStore.setPass2,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.teal, onPrimary: Colors.black),
                        onPressed: () {
                          singUpStore.signUpPressed();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        child: singUpStore.loading
                            ? Center(
                                child: CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                ),
                              )
                            : Center(
                                child: Text(
                                "Cadastre-se",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text("Já tem uma conta? Entrar",
                              style: Theme.of(context).textTheme.bodyText1)),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                ],
              ),
            ));
      })),
    );
  }
}
