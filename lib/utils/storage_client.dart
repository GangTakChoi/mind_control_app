import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageClient {
  static final storage = FlutterSecureStorage();

  static const String _isKeepLoginKey = 'isKeepLogin';
  static const String _tokenKey = 'token';

  static void setToken(String token) {
    storage.write(key: _tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    String? token = await storage.read(key: _tokenKey);
    return token;
  }

  static void deleteToken() {
    storage.delete(key: _tokenKey);
  }

  static void setIsKeepLogin(bool isKeepLogin) {
    storage.write(key: _isKeepLoginKey, value: isKeepLogin.toString());
  }

  static Future<bool> getIsKeepLogin() async {
    String isKeepLogin = await storage.read(key: _isKeepLoginKey) ?? 'false';

    if (isKeepLogin == 'true') {
      return true;
    } else {
      return false;
    }
  }
}
