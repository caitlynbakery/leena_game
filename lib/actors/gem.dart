import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Gem extends PositionComponent with CollisionCallbacks {
  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    add(RectangleHitbox());
    return super.onLoad();
  }
}
