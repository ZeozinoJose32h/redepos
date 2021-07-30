import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redepos/screens/login_screen.dart';
import 'package:redepos/stores/user_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<UserStore>(
      create: (_) => UserStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        title: 'RedePOS',
        home: LoginScreen(),
      ),
    );
  }
}
