import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:leena/main.dart';

class Intro extends PositionComponent with HasGameRef<LeenaGame> {
  Intro({required size}) : super(size: size);

  late SpriteComponent dad;
  late SpriteComponent button;
  String introString =
      'Leena, this is your father. My ship has crashed and the crystals  that power my '
      'engines are gone. I will be trapped here unless '
      'you can gather 4 magic crystals and bring them to me. '
      'The only vehicle that can move quickly in the gravity of '
      'this planet is the hoverboard I made for you. Good luck. ';

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    dad = SpriteComponent()
      ..sprite = gameRef.dadSprite
      ..size = Vector2(size.y, size.y)
      ..position = Vector2(size.x / 2, 50);
    add(dad);
    button = SpriteComponent()
      ..sprite = gameRef.buttonSprite
      ..size = Vector2(300, 168)
      ..position = Vector2(300, 400);
    add(button);
    add(IntroBox(introString, size.x / 2)..position = Vector2(100, 50));
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    canvas.drawColor(Colors.blueGrey, BlendMode.src);
  }
}

class IntroBox extends TextBoxComponent {
  IntroBox(String text, double width)
      : super(
          text: text,
          textRenderer: TextPaint(
              style: const TextStyle(fontSize: 32.0, color: Colors.black87)),
          boxConfig: TextBoxConfig(timePerChar: 0.05, maxWidth: width),
        );

  @override
  void drawBackground(Canvas c) {
    Rect rect = Rect.fromLTWH(0, 0, width, height);
    c.drawRect(rect, Paint()..color = Colors.white24);
  }
}
