import 'package:flutter/material.dart';
import '../entity/gomokuStatus.dart';

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
    // 颜色控制
    final Color color1 = widget.gomokuStatus.winPlayer == 1
        ? Color.fromRGBO(250, 173, 20, 1.0)
        : widget.gomokuStatus.nowPlayer == 1
            ? Color.fromRGBO(24, 144, 255, 1.0)
            : Colors.black;
    final Color color2 = widget.gomokuStatus.winPlayer == 2
        ? Color.fromRGBO(250, 173, 20, 1.0)
        : widget.gomokuStatus.nowPlayer == 2
            ? Color.fromRGBO(24, 144, 255, 1.0)
            : Colors.black;
    final String titleText =
        widget.gomokuStatus.typeList[widget.gomokuStatus.type];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(width / 15, titlePadding, 0, 0),
          height: basicHeight / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: Text(
                  titleText,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kn - AI Gomoku',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        Container(
            height: basicHeight / 2,
            child: Card(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: basicHeight / 3.3,
                      height: basicHeight / 3.3,
                      padding: EdgeInsets.fromLTRB(0, 255, 0, 0),
                      decoration: BoxDecoration(
                        color: color1,
                        image: DecorationImage(
                          image: ExactAssetImage('assets/piece2.jpg'),
                          fit: BoxFit.fill,
                        ),
                        border: Border.all(
                          color: color1,
                          width: 2.5,
                        ),
                      ),
                    ),
                    Text(
                      'Player 1',
                      style: TextStyle(
                        color: color1,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: basicHeight / 3.3,
                      height: basicHeight / 3.3,
                      padding:
                          EdgeInsets.fromLTRB(width / 4, titlePadding, 0, 0),
                      decoration: BoxDecoration(
                        color: color2,
                        image: DecorationImage(
                          image: ExactAssetImage('assets/piece1.jpg'),
                          fit: BoxFit.fill,
                        ),
                        border: Border.all(
                          color: color2,
                          width: 2.0,
                        ),
                      ),
                    ),
                    Text(
                      widget.gomokuStatus.type == 1 ? 'AI' : 'Player 2',
                      style: TextStyle(
                        color: color2,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    )
                  ],
                ),
              ],
            )))
      ],
    );
  }
}

class TitleUI extends StatefulWidget {
  final GomokuStatus gomokuStatus;

  TitleUI(this.gomokuStatus);

  @override
  TitleUIState createState() => new TitleUIState();
}
