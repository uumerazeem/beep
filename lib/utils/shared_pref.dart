import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static SharedPreferences? sharedPreferences;

  static Future initializeStorage() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveSelectedLanguage(bool? isEnglish) async {
    await sharedPreferences?.setBool('isEnglish', isEnglish!);
  }

  static bool? getSelectedLanguage() {
    bool? isEnglish = sharedPreferences?.getBool('isEnglish');

    return isEnglish;
  }

  static saveUserName(String? name) async {
    await sharedPreferences?.setString('name', name!);
  }

  static String? getUserName() {
    String? name = sharedPreferences?.getString('name');

    return name;
  }
   static saveLogged(String? logged) async {
    await sharedPreferences?.setString('logged', logged!);
  }

  static String? getLogged() {
    String? logged = sharedPreferences?.getString('logged');

    return logged;
  }
}
