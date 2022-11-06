// ignore_for_file: must_be_immutable

import 'package:asignment/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputField extends StatefulWidget {
  Widget fieldIcon;
  String hintText;
  bool isEnglish;
  bool isPassword;
  bool? isPhone;
  TextEditingController? controller = TextEditingController();

  CustomInputField(
      {Key? key,
      required this.fieldIcon,
      required this.hintText,
      required this.isEnglish,
      required this.isPassword,
      this.controller,
      this.isPhone})
      : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  final bool _validate = false;

  bool isObsecure = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColor.purple)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Row(
          children: [
            widget.isEnglish
                ? Expanded(
                    flex: 1,
                    child:  Container(
                      height: 60.h,
                      width: 60.w,
                      color: AppColor.scondary,
                      child: Center(child: widget.fieldIcon))
                  )
                : SizedBox(),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(8.r))),
                height: 60.h,
                child: TextField(
                  //TestField
                  controller: widget.controller,
                  textAlign: widget.isEnglish ? TextAlign.start : TextAlign.end,
                  obscureText: widget.isPassword == true ? isObsecure : false,

                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: "Poppins-Regular"),
                      errorText: _validate ? "Username" : null,
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      fillColor: AppColor.textFieldFilled,
                      filled: true,
                      prefixIcon:
                          widget.isPhone == null || widget.isPhone == false
                              ? null
                              : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "+996",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontFamily: "Poppins-Regular"),
                                  ),
                              ),
                      suffixIcon: widget.isPassword == true
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObsecure = !isObsecure;
                                });
                              },
                              child: Icon(
                                isObsecure == true
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                                size: 24,
                              ),
                            )
                          : null),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: "Poppins-Regular"),
                ),
              ),
            ),
            widget.isEnglish == false
                ? Expanded(
                    flex: 1,
                    child: Container(
                        height: 60.h,
                        width: 60.w,
                        color: AppColor.scondary,
                        child: Center(child: widget.fieldIcon)),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
