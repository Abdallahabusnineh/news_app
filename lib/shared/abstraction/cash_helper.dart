import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
     sharedPreferences = await SharedPreferences.getInstance();
  }
  static late   String _token;

  static set token(String value) {
    _token = value;
    saveData(key: "token", value: value);
  }
  static String get token => _token;



  static dynamic getData({required String key}) => sharedPreferences.get(key);

  static Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }

    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }

    return await sharedPreferences.setDouble(key, value);
  }

  static Future<bool> removeData({required String key}) async => await sharedPreferences.remove(key);

  static Future<bool> isDark() async => sharedPreferences.getBool("is_dark") ?? false;

  static Future<void> setTheme(bool isDark) async => sharedPreferences.setBool("is_dark", isDark);

//TODO: use it when start coding
// static Future<void> getAppConstant() async {
//   token = await CacheHelper.getData(key: "token") ?? "";
//   logo = await CacheHelper.getData(key: "logo") ?? "";
//   background = await CacheHelper.getData(key: "background") ??
//       "https://images.unsplash.com/photo-1428366890462-dd4baecf492b?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGJ1aWxkaW5nfGVufDB8fDB8fHww";
// }
}
// HACK: Abd: Remove extra line