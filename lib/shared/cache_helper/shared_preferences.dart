import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static late SharedPreferences sharedPref;

  static Future<void> init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(String dataKey, bool dataValue) async {
    return await sharedPref.setBool(dataKey, dataValue);
  }

  static bool? getData(String dataKey) {
    return sharedPref.getBool(dataKey);
  }
}
