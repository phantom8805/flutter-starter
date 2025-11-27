import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFacade {
  final _storage = SharedPreferences.getInstance();

  Future<String?> get(String key) async {
    final storage = await _storage;
    final name = storage.getString(key.toString());
    return name;
  }

  Future<String> getOrFail(String key) async {
    final res = await get(key);

    if (res == null) {
      throw Exception('Storage key not found, key: $key');
    }

    return res;
  }

  Future<void> set(String key, String value) async {
    final storage = await _storage;
    await storage.setString(key.toString(), value);
  }

  Future<void> remove(String key) async {
    final storage = await _storage;
    await storage.remove(key.toString());
  }

  Future<void> setFlag(String flag, bool value) async {
    final storage = await _storage;
    await storage.setBool(flag.toString(), value);
  }

  Future<bool?> getFlag(String flag) async {
    final storage = await _storage;
    final name = storage.getBool(flag.toString());
    return name;
  }
}
