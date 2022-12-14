import 'dart:async';
import 'dart:developer';

import 'package:asignment/controllers/lang_controller.dart';
import 'package:asignment/screens/auth/login_screen.dart';
import 'package:asignment/screens/landing.dart';
import 'package:asignment/utils/app_colors.dart';
import 'package:asignment/utils/app_images.dart';
import 'package:asignment/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LanguageController languageController = Get.put(LanguageController());
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      getData();
    });
  }

  getData() async {
    var status = await PreferencesService.getLogged();
log("logged status $status");
    if (status == null || status == "false") {
      Get.off(() => const LoginScreen());
    }
    else{
      Get.off(() =>  LandingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Stack(
        children: [
          Positioned(
            top: 59.h,
            left: 168.w,
            child: Image.asset(
              AppImages.circleWhite,
              width: 41.w,
              height: 41.h,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 193.h,
            left: 39.w,
            child: Image.asset(
              AppImages.circleWhite,
              width: 63.w,
              height: 63.h,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          Center(
            child: Image.asset(
              AppImages.englishLogo,
              width: 210.06.w,
              height: 111.18.h,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              child: Image.asset(
                AppImages.greenWhiteCircles,
                width: 402.w,
                height: 220.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
