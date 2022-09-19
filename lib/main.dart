import 'package:flame/game.dart';
import 'package:flappy_bird/hopy_bird_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const GameWidget.controlled(gameFactory: HopyBirdGame.new),
  );
}
