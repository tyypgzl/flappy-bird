import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:hopy_bird/core/enum/assets.dart';
import 'package:hopy_bird/hopy_bird_game.dart';

class BaseParallax extends ParallaxComponent<HopyBirdGame> {
  BaseParallax(this.currentSpeed);

  final double currentSpeed;

  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData(Assets.base.path),
      ],
      alignment: Alignment.bottomCenter,
      fill: LayerFill.width,
      baseVelocity: Vector2(currentSpeed, 0),
    );
  }
}
