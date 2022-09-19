import 'package:flame/components.dart';
import 'package:flappy_bird/core/style/hoopy_bird_style.dart';
import 'package:flutter/material.dart';

class GameText extends TextComponent {
  final TextStyle? textStyle;

  GameText({
    required super.text,
    required super.position,
    this.textStyle,
  }) : super(
          textRenderer: TextPaint(
            style: textStyle ?? HopyBirdStyle.startHoppyBirdTextStyle,
          ),
          anchor: Anchor.center,
        );
}
