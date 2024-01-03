import 'package:shared_preferences/shared_preferences.dart';

class CashDate {
 static SharedPreferences? sharedPreferences;

   static Future <void> cashInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future<bool> setDate({required String key, required dynamic value}) async{
    if (value is int) {
      await sharedPreferences?.setInt(key, value);
      return true;
    }
    if (value is String) {
     await sharedPreferences?.setString(key, value);
     return true;
    }
    if( value is double )
    {
     await sharedPreferences?.setDouble(key, value);
     return true;
    }
    if( value is bool )
    {
     await sharedPreferences?.setBool(key, value);
     return true;
    }
    return false;
  }
  static dynamic getData({required String key})
  {
   return sharedPreferences?.get(key);
  }
  static  Future <bool>? deletData({required String key})
  {
   return sharedPreferences?.remove(key);

  }
}
