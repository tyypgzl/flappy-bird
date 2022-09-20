import 'dart:collection';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:hopy_bird/components/obstacle/obstacle.dart';
import 'package:hopy_bird/components/obstacle/obstacles.dart';
import 'package:hopy_bird/core/constants/game_constants.dart';
import 'package:hopy_bird/core/enum/obstacle_type.dart';
import 'package:hopy_bird/hopy_bird_game.dart';

class ObstacleManager extends Component with HasGameRef<HopyBirdGame> {
  ListQueue<Obstacles> history = ListQueue();

  @override
  Future<void> onLoad() async {
    createObstacles();
  }

  @override
  void update(double dt) {
    if (history.isNotEmpty) {
      history.last.upObstacle.position.x -= GameConst.gameSpeed * dt;
      history.last.downObstacle.position.x -= GameConst.gameSpeed * dt;
      if (history.last.upObstacle.position.x <= gameRef.screenWidth / 2) {
        createObstacles();
      }
      if (history.length >= 2) {
        history.elementAt(history.length - 2).upObstacle.position.x -=
            GameConst.gameSpeed * dt;
        history.elementAt(history.length - 2).downObstacle.position.x -=
            GameConst.gameSpeed * dt;
      }
      final offscreenObstacles =
          history.firstWhere((element) => element.downObstacle.position.x <= 0);
      gameRef.remove(offscreenObstacles);
    }
    super.update(dt);
  }

  void createObstacles() {
    final obstaclesGap =
        gameRef.screenHeight - gameRef.difficulty.spaceForPlayers;
    final gapAboveTheObstacleOnScreen =
        ((2 * GameConst.obstacleHeight) - obstaclesGap) / 2;

    final randomNumber = _randomGenerator(
      min: -gameRef.difficulty.distanceAxisYToGoUpAndDown,
      max: gameRef.difficulty.distanceAxisYToGoUpAndDown,
    );

    final axisYOfUpObstacle = (GameConst.obstacleHeight / 2) -
        gapAboveTheObstacleOnScreen +
        randomNumber;

    final axisYOfDownObstacle = axisYOfUpObstacle +
        GameConst.obstacleHeight +
        gameRef.difficulty.spaceForPlayers;

    final obstacles = Obstacles(
      upObstacle: Obstacle(
        obstacleType: ObstacleType.up,
        position: Vector2(
          gameRef.screenWidth + (GameConst.obstacleWidth / 2),
          axisYOfUpObstacle,
        ),
      ),
      downObstacle: Obstacle(
        obstacleType: ObstacleType.down,
        position: Vector2(
          gameRef.screenWidth + (GameConst.obstacleWidth / 2),
          axisYOfDownObstacle,
        ),
      ),
    );

    history.add(obstacles);
    gameRef.add(obstacles);
  }

  double _randomGenerator({required double min, required double max}) {
    final gap = (max - min).toInt();
    return min + Random().nextInt(gap);
  }
}
