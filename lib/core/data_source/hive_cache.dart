import 'package:hive_flutter/hive_flutter.dart';

class HiveCache {
  static final Box _box = Hive.box('appBox');

  Future<void> setLoggedIn(bool value) async {
    await _box.put('isLoggedIn', value);
  }

  bool isLoggedIn() {
    return _box.get('isLoggedIn', defaultValue: false);
  }

  Future<void> logout() async {
    await _box.put('isLoggedIn', false);
  }
}
