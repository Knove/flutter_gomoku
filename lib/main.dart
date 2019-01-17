import 'package:flutter/material.dart';
import 'widget/gamePage.dart';
import 'widget/titleUI.dart';

void main() => runApp(Gomoku());

class GomokuState extends State<Gomoku> {
  int nowPlayer = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kn - Gomoku',
      home: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[TitleUI(nowPlayer), SWidget(nowPlayer, update)],
      )),
    );
  }

  update(piece) {
    setState(() {
      nowPlayer = piece;
    });
  }
}

class Gomoku extends StatefulWidget {
  @override
  GomokuState createState() => new GomokuState();
}
