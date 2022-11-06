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
}
