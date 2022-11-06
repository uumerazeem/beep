import 'package:asignment/utils/app_colors.dart';
import 'package:asignment/utils/app_images.dart';
import 'package:asignment/widgets/select_lang_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        Padding(
          padding: EdgeInsets.only(top: 15.r, bottom: 25.r),
          child: Text("Please choose your language below and continue to the app.",
              style: TextStyle(
                color: AppColor.offWhite,
                fontSize: 16.sp,
                fontFamily: "Poppins-Regular",
              )),
        ),
       
       
       
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SelectLangauageContainer(
              image: AppImages.saudiFlag,
              isEnglish: false,
              isSelected: false,
            ),
            SelectLangauageContainer(
              image: AppImages.englishFlag,
              isEnglish: true,
              isSelected: true,
            ),
          ],
        ),
       
      ],
    );
  }
}
