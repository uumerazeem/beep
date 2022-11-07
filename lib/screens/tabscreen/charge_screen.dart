import 'dart:ui';

import 'package:asignment/controllers/lang_controller.dart';
import 'package:asignment/utils/app_icons.dart';
import 'package:asignment/utils/app_images.dart';
import 'package:asignment/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class ChargeScreen extends StatelessWidget {
   ChargeScreen({super.key});

    LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.offWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 70.r),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 134.h,
                width: 350.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.greenBox),
                        fit: BoxFit.fill)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.wallet,
                      height: 68.28.h,
                      width: 69.17,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Balance",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: "Poppins-Regular",
                              color: Colors.white),
                        ),
                        Text.rich(
                          textAlign: TextAlign.left,
                          TextSpan(children: [
                            TextSpan(
                              text: "1280",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36.sp,
                                  fontFamily: "Poppins-Regular",
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: " SAR",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36.sp,
                                  fontFamily: "Poppins-Regular"),
                            ),
                          ], style: const TextStyle(height: 1.2)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter Amount to Recharge",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "Poppins-Semibold",
                        color: Color(0xff113544))),

                SizedBox(
                  height: 10.h,
                ),
                CustomField(
                    hint: "0 | SAR",
                    keyboardType: TextInputType.name,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        AppIcon.payments,
                        height: 24.h,
                        width: 24.w,
                      ),
                    )),
                     SizedBox(
                  height: 15.h,
                ),
                Text("Card Holder Name",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "Poppins-Semibold",
                        color: Color(0xff113544))),
                         SizedBox(
                  height: 10.h,
                ),
                CustomField(
                    hint: "Full Name",
                    keyboardType: TextInputType.name,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        AppIcon.person2,
                        height: 16.h,
                        width: 16.w,
                      ),
                    )),
                     SizedBox(
                  height: 15.h,
                ),
                Text("Card Number",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "Poppins-Semibold",
                        color: Color(0xff113544))),
                         SizedBox(
                  height: 10.h,
                ),
                CustomField(
                    hint: "xxxx xxxx xxxx xxxx",
                    keyboardType: TextInputType.name,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        AppIcon.visaCard,
                        height: 16.h,
                        width: 16.w,
                      ),
                    )),
                Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             SizedBox(
                  height: 15.h,
                ),
                            Text("Expiry Date",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: "Poppins-Semibold",
                                    color: Color(0xff113544))),
                                     SizedBox(
                  height: 10.h,
                ),
                            CustomField(
                                hint: "MM/YY",
                                keyboardType: TextInputType.name,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset(
                                    AppIcon.calender,
                                    height: 16.h,
                                    width: 16.w,
                                  ),
                                )),
                          ],
                        )),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             SizedBox(
                  height: 15.h,
                ),
                            Text("CVC",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: "Poppins-Semibold",
                                    color: Color(0xff113544))),
                                     SizedBox(
                  height: 10.h,
                ),
                            CustomField(
                                hint: "xxx",
                                keyboardType: TextInputType.name,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset(
                                    AppIcon.key,
                                    height: 16.h,
                                    width: 16.w,
                                  ),
                                )),
                          ],
                        ))
                  ],
                )
             
          , FullWidthButton(buttonName: "Recharge", onPressed: (){})
             
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  CustomField(
      {super.key,
      required this.hint,
      this.controller,
      required this.keyboardType,
      required this.prefixIcon});
  String hint;
  TextEditingController? controller;
  TextInputType? keyboardType;
  Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(
            color: Color(0xff9B9B9B),
            fontFamily: "Poppins-Regular",
            fontWeight: FontWeight.w500,
            fontSize: 16.sp),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.w, color: Color(0xffE0E0E0)), //<-- SEE HERE
              borderRadius: BorderRadius.circular(8.r),
            ),
            fillColor: Colors.white,
            focusColor: Colors.white,
            filled: true,
            hintText: hint,
            prefixIcon: prefixIcon,
            hintStyle: TextStyle(
                color: Color(0xff9B9B9B),
                fontFamily: "Poppins-Regular",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.w, color: Color(0xffE0E0E0)), //<-- SEE HERE
              borderRadius: BorderRadius.circular(8.r),
            )),
      ),
    );
  }
}
