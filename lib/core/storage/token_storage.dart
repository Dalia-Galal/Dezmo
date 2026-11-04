import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _tokenKey = 'auth_token';
  final FlutterSecureStorage _storage;
  String? _cachedToken;

  TokenStorage(this._storage);

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
    _cachedToken = token;
  }

  Future<String?> getToken() async {
    if (_cachedToken != null) return _cachedToken;
    try {
      _cachedToken = await _storage.read(key: _tokenKey);
    } catch (_) {
      _cachedToken = null;
    }
    return _cachedToken;
  }

   Future<bool> isAuthenticated() async => await getToken() != null;

  Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
    _cachedToken = null;
  }
}
