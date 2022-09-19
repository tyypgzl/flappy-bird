import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/core/constants/game_constants.dart';
import 'package:flappy_bird/core/enum/assets.dart';
import 'package:flappy_bird/core/enum/game_axis.dart';
import 'package:flappy_bird/core/enum/obstacle_type.dart';
import 'package:flappy_bird/hopy_bird_game.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<HopyBirdGame>, CollisionCallbacks {
  final GameAxis axis;
  final ObstacleType obstacleType;

  Obstacle({required this.axis, required this.obstacleType, super.position})
      : super(
          priority: 2,
          size: Vector2(GameConst.obstacleWidth, GameConst.obstacleHeight),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    switch (axis) {
      case GameAxis.down:
        sprite = await gameRef.loadSprite(
          Assets.redPipeDown.path,
        );
        break;

      case GameAxis.up:
        sprite = await gameRef.loadSprite(
          Assets.redPipeUp.path,
        );
        break;
    }

    add(RectangleHitbox());
  }
}
