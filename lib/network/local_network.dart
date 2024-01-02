import 'package:shared_preferences/shared_preferences.dart';

class CachNetwork {
  static late SharedPreferences sharedPref;
  static Future cachinitilization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  // set -get delete clear {key value }
  static Future<bool> insertTocache(
      {required String key, required String value}) async {
    return await sharedPref.setString(key, value);
  }

  static String getcacheData({required String key}) {
    return sharedPref.getString(key) ?? '';
  }

  static Future<bool> deleteCacheItem({required String key}) async {
    return await sharedPref.remove(key);
  }
}
