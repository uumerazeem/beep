import 'package:asignment/controllers/lang_controller.dart';
import 'package:asignment/utils/app_colors.dart';
import 'package:asignment/utils/app_images.dart';
import 'package:asignment/widgets/select_lang_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  LanguageController languageController  = Get.find();
  bool isEnglish = true;
  bool isArabic = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.r, bottom: 25.r),
          child:
              Text("Please choose your language below and continue to the app.",
                  style: TextStyle(
                    color: AppColor.offWhite,
                    fontSize: 16.sp,
                    fontFamily: "Poppins-Regular",
                  )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (mounted) {
                    isArabic = true;
                    isEnglish = false;
                  }
                });
                languageController.isEnglish.value = false;
              },
              child: SelectLangauageContainer(
                image: AppImages.saudiFlag,
                isEnglish: false,
                isSelected: isArabic,
              ),
            ),
            InkWell(
                onTap: () {
                setState(() {
                  if (mounted) {
                    isArabic = false;
                    isEnglish = true;
                  }
                });
                languageController.isEnglish.value = true;
              },
              child: SelectLangauageContainer(
                image: AppImages.englishFlag,
                isEnglish: true,
                isSelected: isEnglish,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
