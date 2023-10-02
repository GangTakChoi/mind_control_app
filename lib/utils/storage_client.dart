import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageClient {
  static void setToken(String token) {
    final storage = FlutterSecureStorage();
    storage.write(key: 'token', value: token);
  }

  static void deleteToken() {
    final storage = FlutterSecureStorage();
    storage.delete(key: 'token');
  }
}
