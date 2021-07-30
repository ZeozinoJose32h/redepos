import 'package:flutter/material.dart';
import 'package:redepos/screens/home/components/body.dart';
import 'package:redepos/widgets/build_app_bar.dart';
import 'package:redepos/widgets/floating_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(),
      floatingActionButton: FloatingButton(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.image),
        onPressed: () {},
      ),
    );
  }
}