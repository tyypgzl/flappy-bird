/*
import 'dart:math';

import 'package:flappy_bird/core/constants/game_constants.dart';
import 'package:flappy_bird/core/enum/game_difficulty.dart';
import 'package:flappy_bird/core/models/obstacle_size.dart';

class ObstacleSizes {
  static ObstacleSize random(double screenHeight, GameDifficulty difficulty) {
    late double upHeight;
    late double downHeight;

    upHeight = _random(
      -(GameConst.obstacleHeight - difficulty.distanceToBorderUp),
      -difficulty.distanceToBorderDown,
    );

    downHeight =
        GameConst.obstacleHeight + upHeight + difficulty.spaceForPlayers;

    final obstacleSize = ObstacleSize(upHeight, downHeight);
    return obstacleSize;
  }

  static double _random(double min, double max) {
    final gap = (max - min).toInt();
    return min + Random().nextInt(gap);
  }
}
*/
