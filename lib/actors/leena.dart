import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:leena/main.dart';
import 'package:leena/world/ground.dart';

class Leena extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<LeenaGame> {
  Leena({required position}) : super(position: position) {
    debugMode = false;
    size = Vector2(83, 100);

    anchor = Anchor.bottomCenter;
  }

  bool onGround = false;
  bool facingRight = true;
  bool hitRight = false;
  bool hitLeft = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox(
        size: Vector2(width * 0.6, height), position: Vector2(20, 0)));
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (x > 0 && gameRef.velocity.x <= 0) {
      gameRef.velocity.x += gameRef.groundFriction;
      if (gameRef.velocity.x > 0) {
        gameRef.velocity.x = 0;
      }
    } else if (x < gameRef.mapWidth - width && gameRef.velocity.x >= 0) {
      gameRef.velocity.x -= gameRef.groundFriction;
      if (gameRef.velocity.x < 0) {
        gameRef.velocity.x = 0;
      }
    } else {
      gameRef.velocity.x = 0;
    }
    if (gameRef.velocity.x == 0 && !onGround) {
      animation = gameRef.idleAnim;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);

    if (other is Ground) {
      if (gameRef.velocity.y > 0) {
        if (intersectionPoints.length == 2) {
          var x1 = intersectionPoints.first[0];
          var x2 = intersectionPoints.last[0];
          if ((x1 - x2).abs() < 10) {
            gameRef.velocity.y = 100;
          } else {
            gameRef.velocity.y = 0;
            onGround = true;
          }
        }
      } else {
        if (gameRef.velocity.x != 0) {
          for (var point in intersectionPoints) {
            if (y - 5 >= point[1]) {
              print('hit on side of ground');
              gameRef.velocity.x = 0;
              if (point[0] > x) {
                print('hit right');
                hitRight = true;
                hitLeft = false;
              } else {
                print('hit left');
                hitLeft = true;
                hitRight = false;
              }
            }
          }
        }
      }
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    onGround = false;
    hitLeft = false;
    hitRight = false;
  }
}
