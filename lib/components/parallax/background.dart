import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:hopy_bird/core/enum/assets.dart';
import 'package:hopy_bird/hopy_bird_game.dart';

class BackgroundParallaxComponent extends ParallaxComponent<HopyBirdGame> {
  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData(Assets.background.path),
      ],
    );
  }
}

