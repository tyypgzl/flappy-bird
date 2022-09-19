import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flappy_bird/components/obstacle/obstacle_manager.dart';
import 'package:flappy_bird/components/parallax/background.dart';
import 'package:flappy_bird/components/parallax/base.dart';
import 'package:flappy_bird/components/player/player_manager.dart';
import 'package:flappy_bird/core/constants/game_constants.dart';
import 'package:flappy_bird/hopy_bird_game.dart';

class HopyBirdHome extends Component
    with TapCallbacks, HasGameRef<HopyBirdGame> {
  late final ObstacleManager obstacleManager;
  late final PlayerManager playerManager;

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  Future<void> onLoad() async {
    add(ScreenHitbox());

    //Parallax
    add(BackgroundParallaxComponent());
    add(BaseParallax(GameConst.gameSpeed));

    // Add
    add(obstacleManager = ObstacleManager());
    add(playerManager = PlayerManager());
  }

  @override
  void update(double dt) {
    super.update(dt);
    playerManager.changePositionDown(value: GameConst.gravity * dt);
    obstacleManager.changePosition(value: GameConst.gameSpeed * dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    playerManager.changePositionUp(value: GameConst.jumpHeight);
    gameRef.hop.start();
    super.onTapDown(event);
  }
}
