import 'package:flutter/material.dart';
import 'router/router.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Router',

      home: Index(),
      // routes: {
      //   // When we navigate to the "/" route, build the FirstScreen Widget
      //   '/': (context) => Index(),
      //   // When we navigate to the "/second" route, build the SecondScreen Widget
      //   '/gomoku': (context) => Gomoku(),
      // },
    );
  }
}
