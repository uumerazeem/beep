
import 'package:asignment/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectLangauageContainer extends StatelessWidget {
  SelectLangauageContainer(
      {Key? key,
      required this.isEnglish,
      required this.isSelected,
      required this.image})
      : super(key: key);
  bool isEnglish;
  bool isSelected;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162.h,
      width: 185.w,
      decoration: BoxDecoration(
          color: isSelected ? AppColor.purple.withOpacity(0.33) : null,
          border: Border.all(
              color: isSelected ? AppColor.skyBlue : AppColor.purple),
          borderRadius: BorderRadius.circular(8.r)),
      child: Stack(
        children: [
        isSelected?  Positioned(
            top: 10.h,
            left: 8.w,
            child: Container(
                height: 23.h,
                width: 23.w,
                decoration: BoxDecoration(
                  color: AppColor.skyBlue,
                   shape: BoxShape.circle
                ),
                child: Icon(
                  Icons.done,
                  size: 20.r,
                  color: Colors.white,
                )),
          ): SizedBox(),
        
        
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 82.h,
                width: 82.w,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.r),
                child: Text(
                 isEnglish? "English" :"عربی",
                  style: TextStyle(
                      fontFamily: isEnglish? "Poppins-Medium": "NKArabic-Bold",
                      color: Colors.white,
                      fontSize: 16.sp),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
