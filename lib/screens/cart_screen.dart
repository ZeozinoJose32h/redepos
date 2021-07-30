import 'package:flutter/material.dart';
import 'package:redepos/widgets/build_app_bar.dart';
import 'package:redepos/widgets/floating_button.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(),
      floatingActionButton: FloatingButton(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Seu carrinho está vazio'),
            GestureDetector(
              child: Text('Clique aqui para comprar seu titulo'),
            )
          ],
        ),
      )
    );
  }
}
