import 'package:flutter/material.dart';

class TitleUIState extends State<TitleUI> {
  @override
  Widget build(BuildContext context) {
    // 屏幕Size
    final Size screenSize = MediaQuery.of(context).size;
    // 宽度
    final double width = screenSize.width;
    // 状态栏高度
    final double titlePadding = MediaQuery.of(context).padding.top;
    // 除去状态栏的高度
    final double height = screenSize.height - titlePadding;
    // 本组件高度
    final double basicHeight = height * 0.2 + titlePadding;

    return Container(
        padding: EdgeInsets.fromLTRB(0, titlePadding, 0, 0),
        height: basicHeight,
        child: Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: basicHeight / 2,
                  height: basicHeight / 2,
                  padding: EdgeInsets.fromLTRB(0, 255, 0, 0),
                  decoration: BoxDecoration(
                    color: widget.nowPlayer == 1
                        ? Color.fromRGBO(24, 144, 255, 1.0)
                        : const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/piece2.jpg'),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.5,
                    ),
                  ),
                ),
                Text(
                  'Player 1',
                  style: TextStyle(
                    color: widget.nowPlayer == 1
                        ? Color.fromRGBO(24, 144, 255, 1.0)
                        : Colors.black,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: basicHeight / 2,
                  height: basicHeight / 2,
                  padding: EdgeInsets.fromLTRB(width / 4, titlePadding, 0, 0),
                  decoration: BoxDecoration(
                    color: widget.nowPlayer == 2
                        ? Color.fromRGBO(24, 144, 255, 1.0)
                        : const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/piece1.jpg'),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                Text(
                  'Player 2',
                  style: TextStyle(
                    color: widget.nowPlayer == 2
                        ? Color.fromRGBO(24, 144, 255, 1.0)
                        : Colors.black,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                )
              ],
            ),
          ],
        )));
  }
}

class TitleUI extends StatefulWidget {
  final int nowPlayer;

  TitleUI(this.nowPlayer);

  @override
  TitleUIState createState() => new TitleUIState();
}
