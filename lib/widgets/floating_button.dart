import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:redepos/screens/cart_screen.dart';
import 'package:redepos/screens/home/home_screen.dart';
import 'package:redepos/screens/user_screen.dart';
import 'package:redepos/stores/user_store.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    UserStore userStore = Provider.of<UserStore>(context);

    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      label: Text('Menu'),
      overlayColor: Colors.blueGrey,
      overlayOpacity: 0.7,
      children: [
        SpeedDialChild(
          child: Icon(Icons.person_sharp),
          backgroundColor: Colors.red,
          label: 'Meus Dados',
          onTap: () async {
             await userStore.getAllData(userStore.token);
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => UserScreen()));
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.accessibility),
          backgroundColor: Colors.blue,
          label: 'Comprar Titulo',
          onTap: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.accessibility),
          backgroundColor: Colors.yellow,
          label: 'Carrinho',
          onTap: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => CartScreen()));
          },
        ),
      ],
    );
  }
}
