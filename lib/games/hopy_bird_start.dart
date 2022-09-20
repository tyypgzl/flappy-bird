import 'package:flame/components.dart';
import 'package:hopy_bird/components/parallax/background.dart';
import 'package:hopy_bird/components/parallax/base.dart';
import 'package:hopy_bird/components/start/game_text.dart';
import 'package:hopy_bird/components/start/start_button.dart';
import 'package:hopy_bird/core/constants/game_constants.dart';
import 'package:hopy_bird/core/constants/string_constants.dart';
import 'package:hopy_bird/core/enum/assets.dart';
import 'package:hopy_bird/core/style/hoopy_bird_style.dart';
import 'package:hopy_bird/hopy_bird_game.dart';

class HopyBirdStart extends Component with HasGameRef<HopyBirdGame> {
  late final Sprite startNormalButton;
  late final Sprite startPressedButton;
  late final Sprite logo;

  @override
  Future<void>? onLoad() async {
    await loadSprites();

    add(BackgroundParallaxComponent());
    add(BaseParallax(GameConst.gameSpeed));

    add(
      GameText(
        text: StringConst.appName,
        position:
            Vector2(gameRef.screenWidth / 2, gameRef.screenHeight / 6 * 1.8),
      ),
    );

    add(
      GameText(
        text: StringConst.clickToStart,
        position:
            Vector2(gameRef.screenWidth / 2, gameRef.screenHeight / 6 * 3),
        textStyle: HopyBirdStyle.startClickToStartStyle,
      ),
    );
    add(
      StartButton(
        normalButton: startNormalButton,
        pressedButton: startPressedButton,
        position:
            Vector2(gameRef.screenWidth / 2, gameRef.screenHeight / 3 * 2),
      ),
    );

    add(
      GameText(
        text: StringConst.webSite,
        position: Vector2(gameRef.screenWidth / 2, gameRef.screenHeight - 30),
        textStyle: HopyBirdStyle.startNameStyle,
      ),
    );
    return super.onLoad();
  }

  Future<void> loadSprites() async {
    startNormalButton = await gameRef.loadSprite(Assets.startNormalButton.path);
    startPressedButton =
        await gameRef.loadSprite(Assets.startPressedButton.path);
    logo = await gameRef.loadSprite(Assets.logo.path);
  }
}
