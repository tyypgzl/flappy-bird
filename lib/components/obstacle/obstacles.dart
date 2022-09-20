import 'package:flame/components.dart';
import 'package:hopy_bird/components/obstacle/obstacle.dart';
import 'package:hopy_bird/hopy_bird_game.dart';

class Obstacles extends Component with HasGameRef<HopyBirdGame> {
  final Obstacle upObstacle;
  final Obstacle downObstacle;
  bool isCreateNextObstacles = true;

  Obstacles({required this.upObstacle, required this.downObstacle});

  @override
  Future<void>? onLoad() {
    createChildren();
    return super.onLoad();
  }

  void createChildren() {
    final children = [upObstacle, downObstacle];
    addAll(children);
  }
}
