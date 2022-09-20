import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:hopy_bird/core/constants/game_constants.dart';
import 'package:hopy_bird/core/enum/assets.dart';
import 'package:hopy_bird/core/enum/game_difficulty.dart';
import 'package:hopy_bird/games/hopy_bird_home.dart';
import 'package:hopy_bird/games/hopy_bird_start.dart';

class HopyBirdGame extends FlameGame
    with HasTappableComponents, HasCollisionDetection {
  late final RouterComponent router;
  late final GameDifficulty difficulty;
  late final double screenWidth;
  late final double screenHeight;
  late final double obstacleHeight;
  late final double obstacleWidth;
  late final double birdAxisY;
  late final AudioPool hop;
  late final AudioPool yat;
  late final int score;

  @override
  bool get debugMode => true;

  @override
  Future<void> onLoad() async {
    await Flame.device.fullScreen();
    await Flame.device.setPortrait();

    hop = await FlameAudio.createPool(Assets.hop.path, maxPlayers: 1);
    yat = await FlameAudio.createPool(Assets.yat.path, maxPlayers: 1);

    score = 0;
    screenWidth = size[0];
    screenHeight = size[1];
    birdAxisY = screenHeight / 2 - GameConst.birdSize / 2;

    difficulty = GameDifficulty.easy;

    add(
      router = RouterComponent(
        routes: {
          'home': Route(HopyBirdHome.new),
          'start': Route(HopyBirdStart.new),
        },
        initialRoute: 'start',
      ),
    );
  }
}
