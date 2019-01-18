import 'package:flutter/material.dart';

/// 下子函数
///
/// 下子根据坐标来决定更改数组的值
playerPiece(List<List<int>> checkerboard, Offset offset, double height,
    double titlePadding, Size screenSize) {
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
  return [c_X, c_Y];
}
