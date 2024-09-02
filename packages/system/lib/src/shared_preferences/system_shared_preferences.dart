import 'package:shared_preferences/shared_preferences.dart';

class SystemSharedPreferences {
  Future<SharedPreferences> get _instance => SharedPreferences.getInstance();

  Future<void> clear() async {
    final sharedPreferences = await _instance;
    await sharedPreferences.clear();
  }

  Future<void> parcialClear(Map<String, Type> noDeleteKeys) async {
    final sharedPreferences = await _instance;

    final values = <dynamic>[];
    final noDeleteKeysList = noDeleteKeys.entries.toList();

    for(var i = 0; i < noDeleteKeysList.length; i++){
      dynamic value;

      switch (noDeleteKeysList[i].value) {
        case String:
          value = await read<String>(noDeleteKeysList[i].key);
        case int:
          value = await read<int>(noDeleteKeysList[i].key);
        case double:
          value = await read<double>(noDeleteKeysList[i].key);
        case bool:
          value = await read<bool>(noDeleteKeysList[i].key);
        case const (List<String>):
          value = await read<List<String>>(noDeleteKeysList[i].key);
        default:
          throw Exception('Type not supported');
      }

      values.add(value);
    }

    await sharedPreferences.clear();

    for(var i = 0; i < noDeleteKeysList.length; i++){
      if(values[i] != null){
        switch (noDeleteKeysList[i].value) {
          case String:
            await write<String>(noDeleteKeysList[i].key, values[i] as String);
          case int:
            await write<int>(noDeleteKeysList[i].key, values[i] as int);
          case double:
            await write<double>(noDeleteKeysList[i].key, values[i] as double);
          case bool:
            await write<bool>(noDeleteKeysList[i].key, values[i] as bool);
          case const (List<String>):
            await write<List<String>>(noDeleteKeysList[i].key, values[i] as List<String>);
          default:
            throw Exception('Type not supported');
        }
      }
      
    }
  }

  Future<bool> contains(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.containsKey(key);
  }

  Future<V?> read<V>(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.get(key) as V?;
  }

  Future<void> remove(String key) async {
    final sharedPreferences = await _instance;
    await sharedPreferences.remove(key);
  }

  Future<void> write<V>(String key, V value) async {
    final sharedPreferences = await _instance;

    switch (V) {
      case String:
        await sharedPreferences.setString(key, value as String);
      case int:
        await sharedPreferences.setInt(key, value as int);
      case double:
        await sharedPreferences.setDouble(key, value as double);
      case bool:
        await sharedPreferences.setBool(key, value as bool);
      case const (List<String>):
        await sharedPreferences.setStringList(key, value as List<String>);
      default:
        throw Exception('Type not supported');
    }
  }
}