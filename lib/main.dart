import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:leena/actors/leena.dart';
import 'package:tiled/tiled.dart';
import 'world/ground.dart';
import 'actors/gem.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(GameWidget(game: LeenaGame()));
}

class LeenaGame extends FlameGame with HasCollisionDetection, TapDetector {
  Leena leena = Leena();
  final double gravity = 2.8;
  final double pushSpeed = 100;
  final double jumpForce = 180;
  final double groundFriction = .4;
  Vector2 velocity = Vector2(0, 0);
  late TiledComponent homeMap;
  late SpriteAnimation rideAnim;
  late SpriteAnimation pushAnim;
  late SpriteAnimation idleAnim;
  late SpriteAnimation jumpAnim;
  late double mapWidth;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    await super.onLoad();

    homeMap = await TiledComponent.load('map2.tmx', Vector2.all(32));
    add(homeMap);

    mapWidth = 32.0 * homeMap.tileMap.map.width;
    double mapHeight = 32.0 * homeMap.tileMap.map.height;
    final obstacleGroup = homeMap.tileMap.getLayer<ObjectGroup>('ground');

    for (final obj in obstacleGroup!.objects) {
      add(Ground(
          size: Vector2(obj.width, obj.height),
          position: Vector2(obj.x, obj.y)));
      print(obj.x);
    }

    var gemGroup = homeMap.tileMap.getLayer<ObjectGroup>('gems');

    for (final gem in gemGroup!.objects) {
      add(Gem());
    }

    camera.viewport = FixedResolutionViewport(Vector2(1280, mapHeight));

    rideAnim = SpriteAnimation.spriteList(
        await fromJSONAtlas('leena.png', 'leena.json'),
        stepTime: 0.1);
    pushAnim = SpriteAnimation.spriteList(
        await fromJSONAtlas('push.png', 'push.json'),
        stepTime: 0.1);
    idleAnim = SpriteAnimation.spriteList(
        await fromJSONAtlas('idle.png', 'idle.json'),
        stepTime: 0.1);
    jumpAnim = SpriteAnimation.spriteList(
        await fromJSONAtlas('flip.png', 'flip.json'),
        stepTime: 0.1);

    leena
      ..animation = rideAnim
      ..size = Vector2(83, 100)
      ..position = Vector2(500, 30);
    add(leena);
    camera.followComponent(leena,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    if (!leena.onGround) {
      velocity.y += gravity;
    }
    leena.position += velocity * dt;
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    if (leena.onGround) {
      // move left
      if (info.eventPosition.viewport.x < 200) {
        if (leena.facingRight) {
          leena.flipHorizontallyAroundCenter();
          leena.facingRight = false;
        }
        if (!leena.hitLeft) {
          print('go left');
          leena.x -= 5;
          velocity.x -= pushSpeed;
          leena.animation = pushAnim;
          Future.delayed(const Duration(milliseconds: 1200), () {
            leena.animation = rideAnim;
          });
        }
        // go right
      } else if (info.eventPosition.viewport.x > size[0] - 200) {
        if (!leena.facingRight) {
          leena.flipHorizontallyAroundCenter();
          leena.facingRight = true;
        }
        if (!leena.hitRight) {
          leena.x += 5;
          velocity.x += pushSpeed;
          leena.animation = pushAnim;
          Future.delayed(const Duration(milliseconds: 1200), () {
            leena.animation = rideAnim;
          });
        }
      }
      if (info.eventPosition.game.y < 100) {
        print('up!');
        leena.animation = jumpAnim;
        Future.delayed(const Duration(milliseconds: 1200), () {
          leena.animation = rideAnim;
        });
        leena.y -= 10;
        velocity.y = -jumpForce;
        leena.onGround = false;
      }
    }
  }
}
