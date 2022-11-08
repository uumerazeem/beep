import 'package:asignment/controllers/auth_Controller.dart';
import 'package:asignment/utils/app_colors.dart';
import 'package:asignment/utils/app_images.dart';
import 'package:asignment/widgets/app_bar_button.dart';
import 'package:asignment/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen(
      {Key? key,
      required this.verificationId,
      required this.token,
      required this.phoneN})
      : super(key: key);
  String verificationId;
  String token;
  String phoneN;
  TextEditingController? pin = TextEditingController();
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Align(alignment: Alignment.topLeft, child: AppBarButton()),
            SizedBox(
              height: 550.h,
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
                    top: 0.h,
                    left: 370.w,
                    child: Image.asset(
                      AppImages.circleWhite,
                      width: 81.w,
                      height: 81.h,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  Positioned(
                    top: 76.h,
                    left: 325.w,
                    child: Image.asset(
                      AppImages.circleWhite,
                      width: 27.w,
                      height: 27.h,
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
                              image: AssetImage(AppImages.verifyBanner),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Positioned(
                    top: 137.h,
                    left: 38.w,
                    child: Image.asset(
                      AppImages.circleWhite,
                      width: 43.w,
                      height: 43.h,
                    ),
                  ),
                  Positioned(
                    right: 0.w,
                    top: 162.h,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.44,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages.carWash),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.r),
                      child: Text.rich(
                        textAlign: TextAlign.left,
                        TextSpan(children: [
                          TextSpan(
                            text: "Phone",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontFamily: "Poppins-Regular"),
                          ),
                          TextSpan(
                            text: " Verification",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontFamily: "Poppins-Semibold"),
                          ),
                        ], style: const TextStyle(height: 1.2)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Please enter below 5 digit code that you received on your phone.",
                    style: TextStyle(
                        color: AppColor.offWhite,
                        fontSize: 16.sp,
                        fontFamily: "Poppins-Regular"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 34.h,
                          width: 34.w,
                          decoration: BoxDecoration(
                            color: AppColor.skyBlue,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Center(
                            child: Text(
                              "01",
                              style: TextStyle(
                                  color: AppColor.offWhite,
                                  fontSize: 16.sp,
                                  fontFamily: "Poppins-Regular"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.r),
                          child: Text(
                            ":",
                            style: TextStyle(
                                color: AppColor.offWhite,
                                fontSize: 16.sp,
                                fontFamily: "Poppins-Semibold"),
                          ),
                        ),
                        Container(
                          height: 34.h,
                          width: 34.w,
                          decoration: BoxDecoration(
                            color: AppColor.skyBlue,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Center(
                            child: Text(
                              "00",
                              style: TextStyle(
                                  color: AppColor.offWhite,
                                  fontSize: 16.sp,
                                  fontFamily: "Poppins-Regular"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  PinInputTextField(
                    pinLength: 6,
                    controller: pin,
                    decoration: BoxLooseDecoration(
                      strokeColorBuilder: PinListenColorBuilder(
                          AppColor.purple, AppColor.purple),
                      textStyle: TextStyle(
                          color: AppColor.offWhite,
                          fontSize: 16.sp,
                          fontFamily: "Poppins-Semibold"),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Obx((){
                    return authController.verifyLoading.value ==true?
                    Center(
                      child: CircularProgressIndicator(
                        color: AppColor.scondary,
                      ),
                    )
                    :
                    FullWidthButton(
                      buttonName: "Verify",
                      onPressed: () {
                        // Get.to(VerifyScreen());
                        if (pin!.text.trim().length < 7) {
                          authController.verifyUser(
                              verificationId, pin!.text.trim(), phoneN);
                        } else {
                          Get.snackbar("Error", "Enter 6 digit number");
                        }
                      });
                  }),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.r),
                    child: InkWell(
                      onTap: () {
                        authController.sendNumber(phoneN, false);
                      },
                      child: Text.rich(
                        textAlign: TextAlign.left,
                        TextSpan(children: [
                          TextSpan(
                            text: "Did not receive OTP?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: "Poppins-Regular"),
                          ),
                          TextSpan(
                            text: "Resend",
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
            )
          ],
        ),
      ),
    );
  }
}
