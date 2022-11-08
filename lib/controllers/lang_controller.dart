import 'package:asignment/utils/shared_pref.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  var isEnglish = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getLanguage();
  }

  getLanguage() async {
    var status = await PreferencesService.getSelectedLanguage();

    if (status == true) {
      isEnglish.value = true;
    }
    if (status == false) {
      isEnglish.value = false;
    }
  }

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
