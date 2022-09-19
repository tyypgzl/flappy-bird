import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/core/enum/assets.dart';
import 'package:flappy_bird/hopy_bird_game.dart';

class Player extends SpriteComponent
    with HasGameRef<HopyBirdGame>, CollisionCallbacks {
  Player({super.position, super.size}) : super(priority: 2);

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(Assets.ened.path);
    add(RectangleHitbox());
  }

  @override
  Future<void> onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) async {
    await gameRef.yat.start();

    super.onCollisionStart(intersectionPoints, other);
  }
}
