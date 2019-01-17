import 'package:flutter/material.dart';
import '../painter/painter.dart';
import '../painter/painterPiece.dart';

class SWidgetState extends State<SWidget> {
  var checkerboard = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ];
  @override
  Widget build(BuildContext context) {
    // 屏幕Size
    final Size screenSize = MediaQuery.of(context).size;
    // 状态栏高度
    final double titlePadding = MediaQuery.of(context).padding.top;
    // 除去状态栏的高度
    final double height = screenSize.height - titlePadding;
    // 本组件高度
    final double realHeight = height * 0.7;
    // 本组件的Size
    final Size basicSize = Size(screenSize.width, realHeight);
    return GestureDetector(
      onTapUp: (TapUpDetails details) {
        // 下子
        pieceDown(checkerboard, details.globalPosition, height, titlePadding,
            screenSize);
      },
      child: CustomPaint(
          size: basicSize,
          foregroundPainter:
              PiecePainter(checkerboard, screenSize, titlePadding),
          child: CustomPaint(
              size: basicSize,
              foregroundPainter:
                  GomokuPainter(checkerboard, screenSize, titlePadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: realHeight,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/th.jpg'),
                          fit: BoxFit.fill,
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      init();
                    },
                    child: Icon(Icons.cached, color: Colors.black, size: 46),
                  )
                ],
              ))),
    );
  }

  /// 下子函数
  ///
  /// 下子根据坐标来决定更改数组的值
  pieceDown(List<List<int>> checkerboard, Offset offset, double height,
      double titlePadding, Size screenSize) {
    // 当前对面棋子
    final int piece = widget.nowPlayer == 1 ? 2 : 1;
    // 获得真实棋盘的偏移量
    Offset position =
        Offset(offset.dx, offset.dy - (height * 0.2 + titlePadding));
    print(position);

    // 棋盘行数
    final int rows = checkerboard.length;
    // 棋盘列数
    final int columns = checkerboard[0].length;

    final double realHeight = height * 0.7;
    // 起点 X
    final pos_X = realHeight / rows;
    // 起点 Y
    final pos_Y = screenSize.width / columns;

    // 根据偏移量求棋盘 X Y
    final c_X = (((((position.dy - pos_X / 2) * 10)) / (realHeight - pos_X)) *
            ((rows - 1) / 10))
        .round();
    final c_Y =
        (((((position.dx - pos_Y / 2) * 10) / (screenSize.width - pos_Y))) *
                ((columns - 1) / 10))
            .round();
    if (checkerboard[c_X][c_Y] == 0) {
      setState(() {
        checkerboard[c_X][c_Y] = widget.nowPlayer;
      });
      widget.setState(piece);
    }
  }

  /// 初始化棋盘
  ///
  /// 初始化棋盘 回到初始值

  init() {
    setState(() {
      checkerboard = [
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      ];
    });
    widget.setState(1);
  }
}

class SWidget extends StatefulWidget {
  final int nowPlayer;
  final setState;
  SWidget(this.nowPlayer, this.setState);
  @override
  SWidgetState createState() => new SWidgetState();
}
