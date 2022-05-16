import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:leena/actors/leena.dart';
import 'package:tiled/tiled.dart';
import 'world/ground.dart';
import 'actors/gem.dart';
import 'dashboard/dashboard.dart';
import 'world/intro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(
    MaterialApp(
      title: "Leena Game",
      home: Scaffold(
        body: GameWidget(
          game: LeenaGame(),
          overlayBuilderMap: {
            'DashboardOverlay': (BuildContext context, LeenaGame game) {
              return Dashboard(
                game: game,
              );
            }
          },
        ),
      ),
    ),
  );
}

class LeenaGame extends FlameGame with HasCollisionDetection, TapDetector {
  Leena leena = Leena(position: Vector2(450, 30));
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
  late AudioPool pool;
  late Intro intro;

  int magicLevel = 0;

  late Timer countDown;
  int remainingTime = 30;
  bool timerStarted = false;

  bool introFinished = false;
  late Sprite dadSprite;
  int numGems = 0;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    countDown = Timer(1, onTick: () {
      if (remainingTime > 0) {
        remainingTime--;
        overlays.notifyListeners();
      }
    }, repeat: true);

    homeMap = await TiledComponent.load('map2.tmx', Vector2.all(32));
    add(homeMap);
    pool = await AudioPool.create('success.mp3');

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
    numGems = gemGroup!.objects.length;
    for (final gem in gemGroup.objects) {
      var gemSprite = await loadSprite('gems/${gem.type}.png');

      add(Gem(tiledObject: gem)
        ..sprite = gemSprite
        ..position = Vector2(gem.x, gem.y - gem.height)
        ..size = Vector2(gem.width, gem.height));
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

    leena..animation = rideAnim;
    add(leena);
    camera.followComponent(leena,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));

    overlays.add('DashboardOverlay');
    dadSprite = await loadSprite('dad.png');
    intro = Intro(size: size);
    add(intro);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    if (!leena.onGround) {
      velocity.y += gravity;
    }
    leena.position += velocity * dt;

    if (timerStarted && remainingTime > 0) {
      countDown.update(dt);
    }
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    if (!introFinished) {
      introFinished = true;
      remove(intro);
      overlays.notifyListeners();
    }
    if (leena.onGround && introFinished) {
      // move left
      if (info.eventPosition.viewport.x < 200) {
        timerStarted = true;
        if (leena.facingRight) {
          leena.flipHorizontallyAroundCenter();
          leena.facingRight = false;
        }
        if (!leena.hitLeft && remainingTime > 0) {
          print('go left');
          leena.x -= 10;
          velocity.x -= pushSpeed;
          if (leena.animation != jumpAnim) {
            leena.animation = pushAnim;
            Future.delayed(const Duration(milliseconds: 1200), () {
              leena.animation = rideAnim;
            });
          }
        }
        // go right
      } else if (info.eventPosition.viewport.x > size[0] - 200) {
        timerStarted = true;
        if (!leena.facingRight) {
          leena.flipHorizontallyAroundCenter();
          leena.facingRight = true;
        }
        if (!leena.hitRight && remainingTime > 0) {
          leena.x += 10;
          velocity.x += pushSpeed;
          if (leena.animation != jumpAnim) {
            leena.animation = pushAnim;
            Future.delayed(const Duration(milliseconds: 1200), () {
              leena.animation = rideAnim;
            });
          }
        }
      }
      if (info.eventPosition.game.y < 100) {
        print('up!');
        leena.animation = jumpAnim;
        Future.delayed(const Duration(milliseconds: 1200), () {
          leena.animation = rideAnim;
        });
        if (remainingTime > 0) {
          leena.y -= 10;
          velocity.y = -jumpForce;
          leena.onGround = false;
        }
      }
    }
  }
}
