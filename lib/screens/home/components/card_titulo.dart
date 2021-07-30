import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redepos/stores/user_store.dart';

class CardTitulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeatureCard(
            image: "assets/logo.png",
            press: () {},
          ),
          FeatureCard(
            image: "assets/logo.png",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  FeatureCard({this.image, this.press});

  String? image;
  Function? press;

  @override
  Widget build(BuildContext context) {
    UserStore userStore = Provider.of<UserStore>(context);

    return GestureDetector(
      //onTap: press,
      child: Container(
        child: Card(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300.0,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Numero do titulo: 975.281',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                    Text(
                      'N° da sorte: 975.281',
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'RS5,00',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal, onPrimary: Colors.black),
                    onPressed: () {
                      userStore.setOneValue(userStore.token);
                      final snackBar = SnackBar(
                        content: Text(
                          'Adicionado ao carrinho',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.blueGrey,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text('Adicionar ao carrinho'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.teal, onPrimary: Colors.black),
                      onPressed: () {
                        userStore.remValue(userStore.token);
                        final snackBar = SnackBar(
                          content: Text(
                            'Removido ao carrinho',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.blueGrey,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text('Remover carrinho'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
