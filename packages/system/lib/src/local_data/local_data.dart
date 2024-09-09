import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

enum DataKey {
  user,
  ;
}

class LocalData {
  static const String _USER_NAME = 'USER_NAME';

  Future<void> writeData(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(_USER_NAME, value);
  }
}
