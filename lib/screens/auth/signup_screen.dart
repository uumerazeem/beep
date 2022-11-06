import 'package:asignment/screens/auth/verification_screen.dart';
import 'package:asignment/utils/app_colors.dart';
import 'package:asignment/utils/app_icons.dart';
import 'package:asignment/utils/app_images.dart';
import 'package:asignment/widgets/app_bar_button.dart';
import 'package:asignment/widgets/custom_input_field.dart';
import 'package:asignment/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                    alignment: Alignment.topLeft,
                    child: Text.rich(
                      textAlign: TextAlign.left,
                      TextSpan(children: [
                        TextSpan(
                          text: "Sign Up to",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontFamily: "Poppins-Regular"),
                        ),
                        TextSpan(
                          text: " Beep Alla Beep",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontFamily: "Poppins-Semibold"),
                        ),
                      ], style: const TextStyle(height: 1.2)),
                    ),
                  ),
                 
                 SizedBox(
                  height: 25.h,
                 ),
                  Text(
                    "Please fill out the form below to Register on Beep Alla Beep.?",
                    style: TextStyle(
                        color: AppColor.offWhite,
                        fontSize: 16.sp,
                        fontFamily: "Poppins-Regular"),
                  ),
                  Column(
                    children: [
                       Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.r),
                         child: CustomInputField(
                          fieldIcon: Image.asset(
                            AppIcon.person,
                            height: 16.h,
                            width: 16.w,
                          ),
                          hintText: 'Full Name',
                          isEnglish: true,
                          isPassword: false,
                      ),
                       ),

                      CustomInputField(
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
                      Padding(
                         padding: EdgeInsets.symmetric(vertical: 20.r),
                        child: CustomInputField(
                          fieldIcon: Image.asset(
                            AppIcon.lock,
                            height: 21.h,
                            width: 16.w,
                          ),
                          hintText: 'Password',
                          isEnglish: true,
                          isPassword: true,
                        ),
                      ),
                      CustomInputField(
                          fieldIcon: Image.asset(
                            AppIcon.lockClock,
                            height: 21.h,
                            width: 16.w,
                          ),
                          hintText: 'Confirm Password',
                          isEnglish: true,
                          isPassword: true,
                        ),
                      
                    ],
                  ),
                  Padding(
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
                  FullWidthButton(buttonName: "Sign Up", onPressed: () {

                    Get.to(VerifyScreen());


                  }),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.r),
                    child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Text.rich(
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
                      ),
                    ),
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
