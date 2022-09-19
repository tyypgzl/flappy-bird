import 'dart:collection';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flappy_bird/components/obstacle/obstacle.dart';
import 'package:flappy_bird/core/constants/game_constants.dart';
import 'package:flappy_bird/core/enum/game_axis.dart';
import 'package:flappy_bird/core/enum/obstacle_type.dart';
import 'package:flappy_bird/core/models/obstacle_size.dart';
import 'package:flappy_bird/hopy_bird_game.dart';

class ObstacleManager extends Component with HasGameRef<HopyBirdGame> {
  late final Obstacle _firstDownObstacle;
  late final Obstacle _firstUpObstacle;
  late final Obstacle _lastDownObstacle;
  late final Obstacle _lastUpObstacle;
  bool isAddLastObstacles = false;

  ListQueue<Obstacle> history = ListQueue();

  @override
  Future<void> onLoad() async {
    _createAndAddFirstObstacles();
  }

  @override
  void update(double dt) {
    if (history.isNotEmpty) {
      if (history.last.obstacleType == ObstacleType.first) {
        if (history.last.position.x < gameRef.screenWidth / 2) {
          if (!isAddLastObstacles) {
            isAddLastObstacles = true;
          }
          _createAndAddLastObstacles();
        }
      } else if (history.last.obstacleType == ObstacleType.last) {}
    }
    super.update(dt);
  }

  void _createAndAddFirstObstacles() {
    final obstacleSize = _createRandomObstacleSize();

    _firstUpObstacle = Obstacle(
      axis: GameAxis.up,
      obstacleType: ObstacleType.first,
      position: Vector2(gameRef.screenWidth, obstacleSize.upHeight),
    );

    _firstDownObstacle = Obstacle(
      axis: GameAxis.down,
      obstacleType: ObstacleType.first,
      position: Vector2(gameRef.screenWidth, obstacleSize.downHeight),
    );
    history.add(_firstDownObstacle);
    gameRef.addAll([_firstDownObstacle, _firstUpObstacle]);
  }

  void _createAndAddLastObstacles() {
    final obstacleSize = _createRandomObstacleSize();

    _lastUpObstacle = Obstacle(
      axis: GameAxis.up,
      obstacleType: ObstacleType.last,
      position: Vector2(gameRef.screenWidth, obstacleSize.upHeight),
    );

    _lastDownObstacle = Obstacle(
      axis: GameAxis.down,
      obstacleType: ObstacleType.last,
      position: Vector2(gameRef.screenWidth, obstacleSize.downHeight),
    );
    if (isAddLastObstacles) {
      history.add(_lastDownObstacle);
      gameRef.addAll([_lastDownObstacle, _lastUpObstacle]);
    }
  }

  void changePosition({required double value}) {
    _firstDownObstacle.position.x -= value;
    _firstUpObstacle.position.x -= value;
    if (isAddLastObstacles) {
      _lastDownObstacle.position.x -= value;
      _lastUpObstacle.position.x -= value;
      if (_lastDownObstacle.position.x < gameRef.screenWidth / 2) {
        _firstDownObstacle.position.x = gameRef.screenWidth;
        _firstUpObstacle.position.x -= gameRef.screenWidth;
      }
    }
  }

  ObstacleSize _createRandomObstacleSize() {
    late double upHeight;
    late double downHeight;

    final minValueToUpObstacle = -(GameConst.obstacleHeight -
        gameRef.difficulty.distanceToBorderUp -
        (GameConst.obstacleHeight / 2));

    final maxValueToUpObstacle = -(gameRef.difficulty.distanceToBorderDown -
        (GameConst.obstacleHeight / 2));

    upHeight = _randomGenerator(
      min: minValueToUpObstacle,
      max: maxValueToUpObstacle,
    );

    downHeight = GameConst.obstacleHeight +
        upHeight +
        gameRef.difficulty.spaceForPlayers;

    final obstacleSize = ObstacleSize(upHeight, downHeight);
    return obstacleSize;
  }

  double _randomGenerator({required double min, required double max}) {
    final gap = (max - min).toInt();
    return min + Random().nextInt(gap);
  }
}
