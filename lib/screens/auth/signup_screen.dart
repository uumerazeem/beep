import 'package:asignment/controllers/auth_Controller.dart';
import 'package:asignment/controllers/lang_controller.dart';
import 'package:asignment/screens/auth/verification_screen.dart';
import 'package:asignment/utils/app_colors.dart';
import 'package:asignment/utils/app_icons.dart';
import 'package:asignment/utils/app_images.dart';
import 'package:asignment/widgets/app_bar_button.dart';
import 'package:asignment/widgets/custom_input_field.dart';
import 'package:asignment/widgets/full_width_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  LanguageController languageController = Get.find();
  AuthController authController = Get.find();

  TextEditingController fullName = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Align(alignment: Alignment.topLeft, child: AppBarButton()),
            SizedBox(
              height: 450.h,
              child: Stack(
                children: [
                  Positioned(
                    left: 142.01.w,
                    right: 142.01.w,
                    child: Image.asset(
                      AppImages.arabicLogo,
                      height: 102.h,
                      width: 142.01,
                    ),
                  ),
                  Positioned(
                    top: 20.h,
                    left: -35.w,
                    child: Image.asset(
                      AppImages.circleWhite,
                      width: 81.w,
                      height: 81.h,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  Positioned(
                    top: 110.h,
                    left: 356.w,
                    child: Image.asset(
                      AppImages.circleWhite,
                      width: 43.w,
                      height: 43.h,
                    ),
                  ),
                  Positioned(
                    left: 0.w,
                    top: 162.h,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.92,
                      height: MediaQuery.of(context).size.height * 0.28,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages.signUpPic),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Positioned(
                    top: 148.h,
                    left: 139.w,
                    child: Image.asset(
                      AppImages.circleWhite,
                      width: 27.w,
                      height: 27.h,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: Column(
                children: [
                  Align(
                    alignment: languageController.isEnglish.value
                        ? Alignment.topLeft
                        : Alignment.topRight,
                    child: Text.rich(
                      textAlign: TextAlign.left,
                      TextSpan(children: [
                        TextSpan(
                          text: "Sign Up to".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontFamily: languageController.isEnglish.value
                                  ? "Poppins-Regular"
                                  : "NotoKufiArabic-Bold"),
                        ),
                        TextSpan(
                          text: " Beep Alla Beep".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontFamily: languageController.isEnglish.value
                                  ? "Poppins-Semibold"
                                  : "NotoKufiArabic-Bold"),
                        ),
                      ], style: const TextStyle(height: 1.2)),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Align(
                    alignment: languageController.isEnglish.value
                        ? Alignment.topLeft
                        : Alignment.topRight,
                    child: Text(
                      "Please fill out the form below to Register on Beep Alla Beep?"
                          .tr,
                      style: TextStyle(
                          color: AppColor.offWhite,
                          fontSize: languageController.isEnglish.value
                              ? 16.sp
                              : 24.sp,
                          fontFamily: languageController.isEnglish.value
                              ? "Poppins-Regular"
                              : "Arabic-Regular"),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.r),
                          child: CustomInputField(
                            keyboardType: TextInputType.name,
                            controller: fullName,
                            fieldIcon: Image.asset(
                              AppIcon.person,
                              height: 16.h,
                              width: 16.w,
                            ),
                            hintText: 'Full Name'.tr,
                            isEnglish: true,
                            isPassword: false,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Can\'t be empty';
                              }
                              if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                                  .hasMatch(text)) {
                                return "Numbers or Special character not allowed";
                              }
                              return null;
                            },
                          ),
                        ),
                        CustomInputField(
                          keyboardType: TextInputType.phone,
                          controller: number,
                          fieldIcon: Image.asset(
                            AppIcon.phone,
                            height: 22.h,
                            width: 14.w,
                          ),
                          hintText: '(0)',
                          isEnglish: true,
                          isPassword: false,
                          isPhone: true,
                          validator: (text) {
                            RegExp _regExp = RegExp(r'^[0-9]+$');
                            if (text == null || text.isEmpty) {
                              return 'Can\'t be empty';
                            }
                            // if (_regExp.hasMatch(text)) {
                            //   return "Enter numbers only";
                            // }
                            if (text.length > 10) {
                              return "Pakistani number without 0/+92";
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.r),
                          child: CustomInputField(
                            keyboardType: TextInputType.text,
                            controller: pass,
                            fieldIcon: Image.asset(
                              AppIcon.lock,
                              height: 21.h,
                              width: 16.w,
                            ),
                            hintText: 'Password'.tr,
                            isEnglish: true,
                            isPassword: true,
                          ),
                        ),
                        CustomInputField(
                          keyboardType: TextInputType.text,
                          controller: confirmPass,
                          fieldIcon: Image.asset(
                            AppIcon.lockClock,
                            height: 21.h,
                            width: 16.w,
                          ),
                          hintText: 'Confirm Password'.tr,
                          isEnglish: true,
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                  languageController.isEnglish.value == false
                      ? SizedBox(
                          height: 20.r,
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.r),
                          child: Text.rich(
                            textAlign: TextAlign.left,
                            TextSpan(children: [
                              TextSpan(
                                text: "By signing up you agree with our",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontFamily: "Poppins-Regular"),
                              ),
                              TextSpan(
                                text: " Privacy Policy",
                                style: TextStyle(
                                    color: AppColor.scondary,
                                    fontSize: 16.sp,
                                    fontFamily: "Poppins-Semibold"),
                              ),
                              TextSpan(
                                text: " and",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontFamily: "Poppins-Regular"),
                              ),
                              TextSpan(
                                text: " Terms & Conditions",
                                style: TextStyle(
                                    color: AppColor.scondary,
                                    fontSize: 16.sp,
                                    fontFamily: "Poppins-Semibold"),
                              ),
                            ], style: const TextStyle(height: 1.2)),
                          ),
                        ),
                  Obx(() {
                    return authController.signUpLoading.value == true
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColor.scondary,
                            ),
                          )
                        : FullWidthButton(
                            buttonName: "Sign Up".tr,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (pass.text.trim() ==
                                    confirmPass.text.trim()) {
                                  authController.signUp(number.text.trim(),
                                      fullName.text.trim(), pass.text.trim());
                                } else {
                                  Get.snackbar(
                                      "Error", "Password cannot be matched");
                                }
                              } else {
                                Get.snackbar("Error", "Enter valid form");
                              }
                            });
                  }),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.r),
                    child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: languageController.isEnglish.value
                            ? Text.rich(
                                textAlign: TextAlign.left,
                                TextSpan(children: [
                                  TextSpan(
                                    text: "Already have an account?",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontFamily: "Poppins-Regular"),
                                  ),
                                  TextSpan(
                                    text: " Sign In",
                                    style: TextStyle(
                                        color: AppColor.scondary,
                                        fontSize: 16.sp,
                                        fontFamily: "Poppins-Semibold"),
                                  ),
                                ], style: const TextStyle(height: 1.2)),
                              )
                            : Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: " هل لديك حساب؟",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontFamily: "Poppins-Regular"),
                                  ),
                                  TextSpan(
                                    text: "تسجيل الدخول",
                                    style: TextStyle(
                                        color: AppColor.scondary,
                                        fontSize: 16.sp,
                                        fontFamily: "Poppins-Semibold"),
                                  ),
                                ], style: const TextStyle(height: 1.2)),
                              )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
