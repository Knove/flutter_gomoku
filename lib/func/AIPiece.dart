import 'dart:math';
import 'dart:io';
/// AI下子函数
///
///
AIPiece(List<List<int>> checkerboard) {
  final random = new Random();
  List pieceArray = [];
  for (int i = 0; i < checkerboard.length; i += 1) {
    for (int j = 0; j < checkerboard[0].length; j += 1) {
      if (checkerboard[i][j] == 0) {
        pieceArray.add([i, j]);
      }
    }
  }
  var sureXY = random.nextInt(pieceArray.length);

  return pieceArray[sureXY];
}
