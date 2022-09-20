import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:hopy_bird/hopy_bird_game.dart';

class StartButton extends SpriteComponent
    with TapCallbacks, HasGameRef<HopyBirdGame> {
  StartButton({
    required this.normalButton,
    required this.pressedButton,
    super.position,
  }) : super(
          anchor: Anchor.center,
          size: Vector2(165, 75),
        );

  final Sprite normalButton;
  final Sprite pressedButton;

  @override
  Future<void> onLoad() async {
    sprite = normalButton;
    return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    sprite = normalButton;
    gameRef.router.pushNamed('home');
    super.onTapUp(event);
  }

  @override
  void onTapDown(TapDownEvent event) {
    sprite = pressedButton;
    super.onTapDown(event);
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    sprite = normalButton;
    super.onTapCancel(event);
  }
}
