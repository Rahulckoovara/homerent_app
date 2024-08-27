import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storageutils {
  final _storage = const FlutterSecureStorage();

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> update(String key, String value) async {
    await write(key, value);
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
