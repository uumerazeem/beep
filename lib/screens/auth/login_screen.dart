import 'dart:developer';

import 'package:asignment/controllers/auth_Controller.dart';
import 'package:asignment/controllers/lang_controller.dart';
import 'package:asignment/screens/auth/signup_screen.dart';
import 'package:asignment/screens/select_language.dart';
import 'package:asignment/utils/app_colors.dart';
import 'package:asignment/utils/app_icons.dart';
import 'package:asignment/utils/app_images.dart';
import 'package:asignment/utils/shared_pref.dart';
import 'package:asignment/widgets/custom_input_field.dart';
import 'package:asignment/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool startAnimation = false;
  LanguageController languageController = Get.find();
  AuthController authController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    bool? state = await PreferencesService.getSelectedLanguage();

    if (state != null) {
      setState(() {
        if (mounted) {
          startAnimation = true;
        }
      });
    }
  }

  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 525.h,
              child: Stack(
                children: [
                  Positioned(
                    top: 64.h,
                    left: 142.01.w,
                    right: 142.01.w,
                    child: Image.asset(
                      AppImages.arabicLogo,
                      height: 102.h,
                      width: 142.01,
                    ),
                  ),
                  Positioned(
                    top: 61.h,
                    right: -30.w,
                    child: Image.asset(
                      AppImages.circleWhite,
                      width: 81.w,
                      height: 81.h,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  Positioned(
                    top: 133.h,
                    left: 8.w,
                    child: Image.asset(
                      AppImages.circleWhite,
                      width: 43.w,
                      height: 43.h,
                    ),
                  ),
                  
                  Positioned(
                    left:0.w, 
                    top: 179.h,
                    
                    child:startAnimation == false
                            ? Container(
                      width: MediaQuery.of(context).size.width * 0.92,
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages.boy),
                              fit: BoxFit.fill)),
                      // child: SizedBox(
                      //   width: 408.w,
                      //   height: 260.h,
                      //   child: startAnimation == false
                      //       ? Image.asset(AppImages.boy,
                      //           // width: 408.w,
                      //           height: 260.h,
                      //           fit: BoxFit.fitWidth)
                      //       : Image.asset(
                      //           AppImages.boy,
                      //           width: 408.w,
                      //           height: 280.h,
                      //           fit: BoxFit.fill,
                      //         ),
                      // ),
                    ):Lottie.asset('assets/raw.json', 
                    repeat: false,
                  
                    // frameRate: FrameRate(20),
                     width: MediaQuery.of(context).size.width ,
                      height: MediaQuery.of(context).size.height * 0.35,)
                    ,
                  )
               ,Positioned(
                    top: 174.h,
                    left: 345.w,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30.r),
                    child: Align(
                        alignment: languageController.isEnglish.value
                            ? Alignment.topLeft
                            : Alignment.topRight,
                        child: languageController.isEnglish.value
                            ? Text.rich(
                                textAlign: TextAlign.left,
                                TextSpan(children: [
                                  TextSpan(
                                    text: startAnimation == false
                                        ? "Choose"
                                        : "Login to",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontFamily: "Poppins-Regular"),
                                  ),
                                  TextSpan(
                                    text: startAnimation == false
                                        ? "\nYour Language"
                                        : "\nYour Account",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontFamily: "Poppins-Semibold"),
                                  ),
                                ], style: const TextStyle(height: 1.2)),
                              )
                            : Text("?????????? ???????????? ?????? ??????????",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontFamily: "NotoKufiArabic-Bold"))),
                  ),
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: startAnimation == false ? 270.h : 162.h,
                      child: startAnimation == false
                          ? SelectLanguage()
                          : Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.r),
                                  child: CustomInputField(
                                    controller: phone,
                                    keyboardType: TextInputType.number,
                                    fieldIcon: Image.asset(
                                      AppIcon.phone,
                                      height: 22.h,
                                      width: 14.w,
                                    ),
                                    hintText: '(0)',
                                    isEnglish: true,
                                    isPassword: false,
                                    isPhone: true,
                                  ),
                                ),
                                CustomInputField(
                                  controller: password,
                                  keyboardType: TextInputType.text,
                                  fieldIcon: Image.asset(
                                    AppIcon.lock,
                                    height: 21.h,
                                    width: 16.w,
                                  ),
                                  hintText: 'Password',
                                  isEnglish: true,
                                  isPassword: true,
                                ),
                              ],
                            )),
                  SizedBox(
                    height: 25.h,
                  ),
                  Obx(() {
                    return authController.signInLoading.value == true
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColor.scondary,
                            ),
                          )
                        : FullWidthButton(
                            onPressed: startAnimation == false
                                ? () {
                                    setState(() {
                                      startAnimation = true;
                                    });

                                    languageController.changeLanguage(
                                        languageController.isEnglish.value
                                            ? "en"
                                            : "ar",
                                        languageController.isEnglish.value
                                            ? "US"
                                            : "SA");
                                  }
                                : () {
                                    if (phone.text != "") {
                                      if (password.text != "") {
                                        if (password.text.length > 7) {
                                          authController.login(
                                              phone.text, password.text);
                                        } else {
                                          Get.snackbar("Invalid",
                                              "Password length must 8 or greater");
                                        }
                                      } else {
                                        Get.snackbar(
                                            "Missing", "Password missing");
                                      }
                                    } else {
                                      Get.snackbar(
                                          "Missing", "Phone number missing");
                                    }
                                  },
                            buttonName: startAnimation == false
                                ? "Continue"
                                : "Login".tr,
                          );
                  }),
                  startAnimation == false
                      ? SizedBox()
                      : Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 30.r),
                              child: Text(
                                languageController.isEnglish.value
                                    ? "Forget Password?"
                                    : "???????? ???????? ??????????",
                                style: TextStyle(
                                    color: AppColor.scondary,
                                    fontSize: 16.sp,
                                    fontFamily:
                                        languageController.isEnglish.value
                                            ? "Poppins-Semibold"
                                            : "Arabic-Regular"),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => SignUpScreen());
                              },
                              child: languageController.isEnglish.value
                                  ? Text.rich(
                                      textAlign: TextAlign.left,
                                      TextSpan(children: [
                                        TextSpan(
                                          text: "Don???t have an account?",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp,
                                              fontFamily: "Poppins-Semibold"),
                                        ),
                                        TextSpan(
                                          text: "Sign Up",
                                          style: TextStyle(
                                              color: AppColor.scondary,
                                              fontSize: 16.sp,
                                              fontFamily: "Poppins-Semibold"),
                                        ),
                                      ], style: const TextStyle(height: 1.2)),
                                    )
                                  : Text.rich(
                                      textAlign: TextAlign.left,
                                      TextSpan(children: [
                                        TextSpan(
                                          text: "?????? ???????? ??????????",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp,
                                              fontFamily: "Poppins-Regular"),
                                        ),
                                        TextSpan(
                                          text: "???? ???????????????? ???? ??????",
                                          style: TextStyle(
                                              color: AppColor.scondary,
                                              fontSize: 16.sp,
                                              fontFamily: "Poppins-Semibold"),
                                        ),
                                      ], style: const TextStyle(height: 1.2)),
                                    ),
                            ),
                          ],
                        )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom(
      {Key? key,
      this.controller,
      this.validator,
      this.hint,
      this.borderRadius,
      this.obscureText,
      this.inputFormatters})
      : super(key: key);
  List<TextInputFormatter>? inputFormatters;
  TextEditingController? controller;
  String? hint;
  String? Function(String?)? validator;
  double? borderRadius;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText == null ? false : obscureText!,
        textCapitalization: TextCapitalization.words,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'SF-Regular',
          fontSize: 14.sp,
        ),
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          prefixIcon: Container(
            width: 58.w,
            decoration: BoxDecoration(
                color: AppColor.scondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                )),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3.w, color: AppColor.purple),
          ),
          isDense: true,
          contentPadding:
              EdgeInsets.only(top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius == null ? 8.r : borderRadius!),
              ),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius == null ? 8.r : borderRadius!),
            ),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'SF-Regular',
            fontSize: 14.sp,
          ),
          fillColor: Color(0xff4945DB),
          filled: true,
        ));
  }
}
