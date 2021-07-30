import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:redepos/Screens/signup_screen.dart';
import 'package:redepos/screens/home/home_screen.dart';
import 'package:redepos/stores/login_store.dart';
import 'package:redepos/stores/user_store.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginStore loginStore = LoginStore();

    UserStore userStore = Provider.of<UserStore>(context);

    return Scaffold(
      body: SingleChildScrollView(child: Observer(
        builder: (_) {
          return Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Bem-vindo",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 1,
                            )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(),
                        SizedBox(
                          height: 50,
                        ),
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
                            decoration: InputDecoration(
                                errorText: loginStore.emailError,
                                border: InputBorder.none,
                                hintText: "Email"),
                            onChanged: loginStore.setEmail,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Password"),
                            onChanged: loginStore.setPass,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.teal, onPrimary: Colors.black),
                          onPressed: () async {
                            String? token = await loginStore.loginPressed();
                            if (token != null) {
                              userStore.token = token;
                              final snackBar = SnackBar(
                                content: Text(
                                  'Usuario entrou',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.green,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                            } else  {
                              final snackBar = SnackBar(
                                content: Text(
                                  'Senha ou e-mail invalido',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          },
                          child: loginStore.loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                  "Login",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                            },
                            child: Text("Criar nova conta?",
                                style: Theme.of(context).textTheme.bodyText1))
                      ],
                    )
                  ],
                ),
              ));
        },
      )),
    );
  }
}
