import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hopy_bird/hopy_bird_game.dart';

void main() {
  runApp(
    const GameWidget.controlled(gameFactory: HopyBirdGame.new),
  );
}
