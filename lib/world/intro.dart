import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:leena/main.dart';

class Intro extends PositionComponent with HasGameRef<LeenaGame> {
  Intro({required size}) : super(size: size);

  late SpriteComponent dad;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    dad = SpriteComponent()
      ..sprite = gameRef.dadSprite
      ..size = Vector2(size.y, size.y)
      ..position = Vector2(size.x / 2, 50);
    add(dad);
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    canvas.drawColor(Colors.pink, BlendMode.src);
  }
}
