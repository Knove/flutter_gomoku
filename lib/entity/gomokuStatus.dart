class GomokuStatus {
  // 现在轮到的玩家， 1黑子 2白子
  int nowPlayer;

  // 谁赢了，默认0. 1黑子 2白子
  int winPlayer;

  /// 当前模式
  ///
  /// 1 AI对战 2 玩家VS玩家
  int type;

  // AI或者联网情况下的下子锁
  bool lock;

  // 储存的type文字提示
  final List typeList = [
    '',
    'Player vs AI',
    'Player vs Player',
  ];
  GomokuStatus(this.nowPlayer, this.winPlayer, this.type, this.lock);
}
