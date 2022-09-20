import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:hopy_bird/core/constants/game_constants.dart';
import 'package:hopy_bird/core/enum/assets.dart';
import 'package:hopy_bird/core/enum/obstacle_type.dart';
import 'package:hopy_bird/hopy_bird_game.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<HopyBirdGame>, CollisionCallbacks {
  final ObstacleType obstacleType;

  Obstacle({required this.obstacleType, super.position})
      : super(
          priority: 1,
          size: Vector2(GameConst.obstacleWidth, GameConst.obstacleHeight),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {


    switch (obstacleType) {
      case ObstacleType.up:
        sprite = await gameRef.loadSprite(
          Assets.redPipeUp.path,
        );

        break;
      case ObstacleType.down:
        sprite = await gameRef.loadSprite(
          Assets.redPipeDown.path,
        );

        break;
    }

    add(RectangleHitbox());
  }
}
