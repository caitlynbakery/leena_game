import 'package:flame/collisions.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:leena/actors/leena.dart';
import 'package:leena/main.dart';
import 'package:tiled/tiled.dart';
import 'package:flame/components.dart';

class Gem extends SpriteComponent
    with CollisionCallbacks, HasGameRef<LeenaGame> {
  final TiledObject tiledObject;

  Gem({required this.tiledObject}) : super() {
    debugMode = true;
  }

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    print('hit gem');
    if (other is Leena) {
      //    FlameAudio.play('success.mp3');
      gameRef.pool.start();
      removeFromParent();
      gameRef.magicLevel++;
      gameRef.overlays.notifyListeners();
    }
    super.onCollision(intersectionPoints, other);
  }
}
