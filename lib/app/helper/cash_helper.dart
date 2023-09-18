import '../../main.dart';

class CashHelper {
  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value != null) {
      if (value is bool) return await sharedPref!.setBool(key, value);

      if (value is String) return await sharedPref!.setString(key, value);

      if (value is List<String>) {
        return await sharedPref!.setStringList(key, value);
      }

      return await sharedPref!.setInt(key, value);
    }
    return false;
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPref!.get(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPref!.remove(key);
  }

  static Future<bool> clearData() async {
    return await sharedPref!.clear();
  }
}
