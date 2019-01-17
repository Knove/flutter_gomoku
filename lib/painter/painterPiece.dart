import 'package:flutter/material.dart';

// 绘制棋盘
class PiecePainter extends CustomPainter {
  final List<List<int>> checkerboard;
  final Size screenSize;
  final double titlePadding;

  PiecePainter(this.checkerboard, this.screenSize, this.titlePadding);

  @override
  void paint(Canvas canvas, Size size) {
    // 棋盘行数
    final rows = checkerboard.length;
    // 棋盘列数
    final columns = checkerboard[0].length;
    // 棋盘区域高度
    final height = (screenSize.height - titlePadding) * 0.7;
    // 绘制 起点 X
    final pos_X = screenSize.width / columns / 2;
    // 绘制 起点 Y
    final pos_Y = height / rows / 2;

    Paint paint = Paint();

    for (var i = 0; i < rows; i += 1) {
      for (var j = 0; j < columns; j += 1) {
        if (checkerboard[i][j] != 0) {
          int piece = checkerboard[i][j];
          if (piece == 1) {
            paint.color = Colors.black;
          } else if (piece == 2) {
            paint.color = Colors.white;
          }
          canvas.drawCircle(
              Offset(pos_X + pos_X * 2 * j, pos_Y + pos_Y * 2 * i), 14, paint);
        }
      }
    }
  }

  bool shouldRepaint(PiecePainter oldDelegate) {
    return true;
  }

  bool shouldRebuildSemantics(PiecePainter oldDelegate) => true;
}
