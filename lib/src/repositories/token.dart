import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static SecureStorage? _instance;

  factory SecureStorage() =>
      _instance ??= SecureStorage._(const FlutterSecureStorage());

  SecureStorage._(this._storage);

  final FlutterSecureStorage _storage;
  static const _tokenKey = 'TOKEN';
  static const _emailKey = 'EMAIL';

  Future<void> persistEmailAndToken(String email, String token) async {
    await _storage.write(key: _emailKey, value: email);
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<bool> hasToken() async {
    var value = await _storage.read(key: _tokenKey);
    return value != null;
  }

  Future<Future<String?>> hasEmail() async {
    var value = _storage.read(key: _emailKey);
    return value;
  }

  Future<void> deleteToken() async {
    return _storage.delete(key: _tokenKey);
  }

  Future<void> deleteEmail() async {
    return _storage.delete(key: _emailKey);
  }

  Future<Future<String?>> getEmail() async {
    return _storage.read(key: _emailKey);
  }

  Future<Future<String?>> getToken() async {
    return _storage.read(key: _tokenKey);
  }

  Future<void> deleteAll() async {
    return _storage.deleteAll();
  }
}