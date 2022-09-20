import 'package:flame/components.dart';
import 'package:hopy_bird/components/player/player.dart';
import 'package:hopy_bird/core/constants/game_constants.dart';
import 'package:hopy_bird/hopy_bird_game.dart';

class PlayerManager extends Component with HasGameRef<HopyBirdGame> {
  late final Player _bird;

  @override
  Future<void>? onLoad() async {
    _bird = Player(
      position: Vector2(
        gameRef.screenWidth / 2 - GameConst.birdSize / 2,
        gameRef.birdAxisY,
      ),
      size: Vector2.all(GameConst.birdSize),
    );
    gameRef.add(_bird);
  }

  void changePositionUp({required double value}) {
    _bird.position.y -= value;
  }

  void changePositionDown({required double value}) {
    _bird.position.y += value;
  }
}
