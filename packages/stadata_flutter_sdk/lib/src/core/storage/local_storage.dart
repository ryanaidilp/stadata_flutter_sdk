abstract class LocalStorage {
  Future<dynamic> get(String key);
  Future<bool> save(String key, dynamic value);
  Future<bool> remove(String key);
  Future<bool> has(String key);
}
