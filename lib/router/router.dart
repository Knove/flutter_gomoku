import 'package:flutter/material.dart';
import '../widget/gamePage.dart';
import '../widget/titleUI.dart';
import '../widget/index.dart';
import '../entity/gomokuStatus.dart';

// 棋页
class GomokuState extends State<Gomoku> {
  GomokuStatus gomokuStatus = new GomokuStatus(1, 0, 0, false);

  @override
  Widget build(BuildContext context) {
    gomokuStatus.type = widget.type;
    return MaterialApp(
      title: 'Kn - Gomoku',
      home: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TitleUI(gomokuStatus),
          SWidget(gomokuStatus, updatePiece, updateWinner, updateLock)
        ],
      )),
    );
  }

  updatePiece(piece) {
    setState(() {
      gomokuStatus.nowPlayer = piece;
    });
  }

  updateLock(lock) {
    setState(() {
      gomokuStatus.lock = lock;
    });
  }

  updateWinner(winner) {
    setState(() {
      gomokuStatus.winPlayer = winner;
    });
  }
}

class Gomoku extends StatefulWidget {
  final int type;

  Gomoku(this.type);
  @override
  GomokuState createState() => new GomokuState();
}

// 主页
class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexScreen(),
    );
  }
}
