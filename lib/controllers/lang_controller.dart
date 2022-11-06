import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  void changeLanguage(String langCode, String contCode) {
    Locale locale = Locale(langCode, contCode);
    Get.updateLocale(locale);
  }
}
