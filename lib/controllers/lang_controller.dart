import 'package:asignment/utils/shared_pref.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  var isEnglish = true.obs;

  void changeLanguage(String langCode, String contCode) {
    Locale locale = Locale(langCode, contCode);
    Get.updateLocale(locale);
    PreferencesService.saveSelectedLanguage(langCode == "ar" ? false : true);
    if (langCode == "ar") {
      isEnglish.value = false;
    } else {
      isEnglish.value = true;
    }
  }
}
