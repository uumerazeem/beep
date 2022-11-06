import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static SharedPreferences? sharedPreferences;

  static Future initializeStorage() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }}