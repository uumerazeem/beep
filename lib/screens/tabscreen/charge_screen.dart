import 'dart:ui';

import 'package:asignment/controllers/lang_controller.dart';
import 'package:asignment/controllers/payment_controller.dart';
import 'package:asignment/utils/app_icons.dart';
import 'package:asignment/utils/app_images.dart';
import 'package:asignment/widgets/app_bar_button.dart';
import 'package:asignment/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class ChargeScreen extends StatelessWidget {
  ChargeScreen({super.key});

  LanguageController languageController = Get.put(LanguageController());
  PaymentController paymentController = Get.put(PaymentController());

  final formKey = GlobalKey<FormState>();
  TextEditingController amount = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cvcNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AppBarButton(),
      ),
      body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 57,
            left: 20.0,
            // right: 20.0,
            bottom: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Text(
                'Recharge',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
              // Expanded(child: Container()),
             
              
            ],
          ),
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.only(bottom: 30.r),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColor.offWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 80.r),
                child:   SingleChildScrollView(
                  child: Column(
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
                          Form(
                            key: formKey,
                            child: Padding(
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
                        controller: amount,
                        hint: "0 | SAR",
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(
                              RegExp(r'^[_\-=@,\;]+$')),
                          // FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please, enter amount.";
                          }
                          return null;
                        },
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
                        controller: name,
                        keyboardType: TextInputType.name,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                        ],
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please, enter name.";
                          }
                          return null;
                        },
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
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                        ],
                        validator: (val) {
                          if (val!.length != 15 || val.length != 16) {
                            return "Please, enter correct number.";
                          }
                          if (val.isEmpty) {
                            return "Please, enter card number.";
                          }
                          return null;
                        },
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
                                GestureDetector(
                                  onTap: () {
                                    paymentController.chooseDate();
                                  },
                                  child: CustomField(
                                      enabled: false,
                                      hint: "MM/YY",
                                      keyboardType: TextInputType.datetime,
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset(
                                          AppIcon.calender,
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                      )),
                                ),
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
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(4),
                                    ],
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter CVC";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.r, bottom: 60.r),
                      child: FullWidthButton(
                          buttonName: "Recharge",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                            paymentController.initPaymentSheet(context);
                              
                            } else {
                              Get.snackbar("Something missing",
                                  "something in the form is missing or incorrect");
                            }
                          }),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                              ),
                            ),
                          ),
                        ],
                      ),
                ),
     
              )),
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
      this.inputFormatters,
      this.validator,
      this.enabled,
      required this.prefixIcon});
  String hint;
  TextEditingController? controller;
  TextInputType? keyboardType;
  Widget? prefixIcon;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  bool? enabled;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator,
        style: TextStyle(
            color: Color(0xff9B9B9B),
            fontFamily: "Poppins-Regular",
            fontWeight: FontWeight.w500,
            fontSize: 16.sp),
        decoration: InputDecoration(
            border: InputBorder.none,
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
