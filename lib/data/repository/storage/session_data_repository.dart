import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _StorageKeys {
  static const sessionId = 'sessionId';
}

class SessionDataRepository {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> sessionId() => _secureStorage.read(
        key: _StorageKeys.sessionId,
      );

  Future<void> setSessionId(String sessionId) => _secureStorage.write(
        key: _StorageKeys.sessionId,
        value: sessionId,
      );
}
