enum Assets {
  logo,
  background,
  backgroundNight,
  greenPipeUp,
  greenPipeDown,
  redPipeUp,
  redPipeDown,
  gameOver,
  base,
  cagri,
  ened,
  hop,
  yat,
  startNormalButton,
  startPressedButton;

  String get path {
    switch (this) {
      case Assets.startNormalButton:
        return 'normal-button.png';
      case Assets.startPressedButton:
        return 'pressed-button.png';
      case Assets.logo:
        return 'tguzel.png';
      case Assets.background:
        return 'background-day.png';
      case Assets.backgroundNight:
        return 'background-night.png';
      case Assets.greenPipeUp:
        return 'pipe-green-up.png';
      case Assets.greenPipeDown:
        return 'pipe-green-down.png';
      case Assets.redPipeUp:
        return 'pipe-red-up.png';
      case Assets.redPipeDown:
        return 'pipe-red-down.png';
      case Assets.gameOver:
        return 'gameover.png';
      case Assets.base:
        return 'base.png';
      case Assets.cagri:
        return 'cagri.png';
      case Assets.ened:
        return 'ened.png';
      case Assets.hop:
        return 'hop.mp3';
      case Assets.yat:
        return 'yat.mp3';
    }
  }
}
