/// 判定胜负
///
/// 根据刚下子的值位置判定胜负
int checkOutcome(checkerboard, c_X, c_Y) {
  // 当前下子
  final int piece = checkerboard[c_X][c_Y];
  // 计数
  int pieceNum = 0;

  // X
  for (int i = 0; i < checkerboard[c_X].length; i++) {
    if (checkerboard[c_X][i] == piece)
      pieceNum++;
    else
      pieceNum = 0;
    if (pieceNum == 5) return piece;
  }
  // Y
  for (int i = 0, pieceNum = 0; i < checkerboard.length; i++) {
    if (checkerboard[i][c_Y] == piece)
      pieceNum++;
    else
      pieceNum = 0;
    if (pieceNum == 5) return piece;
  }
  // XY
  int diff = c_X - c_Y;
  int sum = c_X + c_Y;
  int q_X = 0;
  int q_Y = 0;
  if (diff > 0) {
    q_X = diff;
    q_Y = 0;
  } else {
    q_X = 0;
    q_Y = -diff;
  }
  for (int i = 0, pieceNum = 0; i < 2 * checkerboard.length; i++) {
    if (q_X + i >= checkerboard.length || q_Y + i >= checkerboard[0].length)
      break;
    if (checkerboard[q_X + i][q_Y + i] == piece)
      pieceNum++;
    else
      pieceNum = 0;
    if (pieceNum == 5) return piece;
  }
  if (sum < checkerboard.length) {
    q_X = sum;
    q_Y = 0;
  } else {
    q_Y = c_Y - (checkerboard.length - 1 - c_X);
    q_X = checkerboard.length - 1;
  }
  for (int i = 0, pieceNum = 0; i < 2 * checkerboard.length; i++) {
    if (q_X - i < 0 || q_Y + i >= checkerboard[0].length) break;
    if (checkerboard[q_X - i][q_Y + i] == piece)
      pieceNum++;
    else
      pieceNum = 0;
    if (pieceNum == 5) return piece;
  }
  return 0;
}
