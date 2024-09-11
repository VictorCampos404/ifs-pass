import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

enum DataKey {
  user(
    type: Map<String, dynamic>,
  ),
  ;

  final Type type;

  const DataKey({required this.type});
}

class LocalData {
  static Future<SharedPreferences> get _instance =>
      SharedPreferences.getInstance();

  static Future<void> saveData({
    required DataKey key,
    required dynamic value,
  }) async {
    if (!_matchValueType(key.type, value)) {
      throw Exception('Value is not correct type');
    }

    final sharedPreferences = await _instance;

    switch (key.type) {
      case String:
        await sharedPreferences.setString(key.name, value as String);
      case int:
        await sharedPreferences.setInt(key.name, value as int);
      case double:
        await sharedPreferences.setDouble(key.name, value as double);
      case bool:
        await sharedPreferences.setBool(key.name, value as bool);
      case const (List<String>):
        await sharedPreferences.setStringList(key.name, value as List<String>);
      case const (Map<String, dynamic>):
        await sharedPreferences.setString(key.name, jsonEncode(value));
      default:
        throw Exception('Type not supported');
    }
  }

  static Future<dynamic> readData({required DataKey key}) async {
    final sharedPreferences = await _instance;

    switch (key.type) {
      case String:
        return sharedPreferences.get(key.name) as String?;
      case int:
        return sharedPreferences.get(key.name) as int?;
      case double:
        return sharedPreferences.get(key.name) as double?;
      case bool:
        return sharedPreferences.get(key.name) as bool?;
      case const (List<String>):
        return sharedPreferences.get(key.name) as List<String>?;
      case const (Map<String, dynamic>):
        final data = sharedPreferences.get(key.name) as String?;

        if (data != null) {
          return jsonDecode(data) as Map<String, dynamic>?;
        }

        return null;
      default:
        throw Exception('Type not supported');
    }
  }

  static Future<void> clearData({
    required DataKey key,
  }) async {
    final sharedPreferences = await _instance;

    sharedPreferences.remove(key.name);
  }

  static bool _matchValueType(Type type, dynamic value) {
    switch (type) {
      case String:
        return value is String;
      case int:
        return value is int;
      case double:
        return value is double;
      case bool:
        return value is bool;
      case const (List<String>):
        return value is List<String>;
      case const (Map<String, dynamic>):
        return value is Map<String, dynamic>;
      default:
        throw Exception('Type not supported');
    }
  }
}
