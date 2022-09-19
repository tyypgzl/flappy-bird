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

  double get distanceToBorderUp {
    switch (this) {
      case GameDifficulty.easy:
        return 200;
      case GameDifficulty.medium:
        return 150;
      case GameDifficulty.hard:
        return 100;
    }
  }

  double get distanceToBorderDown {
    switch (this) {
      case GameDifficulty.easy:
        return 50;
      case GameDifficulty.medium:
        return 40;
      case GameDifficulty.hard:
        return 30;
    }
  }
}
