enum GameDifficulty {
  easy,
  medium,
  hard;

  double get spaceForPlayers {
    switch (this) {
      case GameDifficulty.easy:
        return 150;
      case GameDifficulty.medium:
        return 110;
      case GameDifficulty.hard:
        return 90;
    }
  }

  double get distanceAxisYToGoUpAndDown {
    switch (this) {
      case GameDifficulty.easy:
        return 100;
      case GameDifficulty.medium:
        return 150;
      case GameDifficulty.hard:
        return 200;
    }
  }
}
