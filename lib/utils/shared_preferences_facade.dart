import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferenceKey { deviceId, token }

enum SharedPreferenceFlag { test }

class SharedPreferencesFacade {
  final _storage = SharedPreferences.getInstance();

  Future<String?> get(SharedPreferenceKey key) async {
    final storage = await _storage;
    final name = storage.getString(key.toString());
    return name;
  }

  Future<void> set(SharedPreferenceKey key, String value) async {
    final storage = await _storage;
    await storage.setString(key.toString(), value);
  }

  Future<void> remove(SharedPreferenceKey key) async {
    final storage = await _storage;
    await storage.remove(key.toString());
  }

  Future<void> setFlag(SharedPreferenceFlag flag, bool value) async {
    final storage = await _storage;
    await storage.setBool(flag.toString(), value);
  }

  Future<bool?> getFlag(SharedPreferenceFlag flag) async {
    final storage = await _storage;
    final name = storage.getBool(flag.toString());
    return name;
  }

  Future<void> cleanAll() async {
    final storage = await _storage;
    await storage.clear();
  }
}
