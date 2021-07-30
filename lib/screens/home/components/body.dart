import 'package:flutter/material.dart';
import 'package:redepos/screens/home/components/card_titulo.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CardTitulo(),
        ],
      ),
    );
  }
}