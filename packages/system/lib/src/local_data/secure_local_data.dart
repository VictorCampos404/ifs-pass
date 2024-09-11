import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum SecureDataKey {
  userName,
  password,
  ;
}

class SecureLocalData {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  SecureLocalData();

  static Future<void> saveData({
    required SecureDataKey key,
    String? value,
  }) async {
    await _storage.write(
      key: key.name,
      value: value,
    );
  }

  static Future<String?> readData(SecureDataKey key) async {
    return _storage.read(
      key: key.name,
    );
  }

  static Future<void> clearData(SecureDataKey key) async {
    await _storage.delete(
      key: key.name,
    );
  }
}
