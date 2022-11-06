
import 'package:asignment/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FullWidthButton extends StatelessWidget {
   FullWidthButton({
    Key? key,
    required this.buttonName,
    required this.onPressed
  }) : super(key: key);
void Function()? onPressed;
String buttonName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
         backgroundColor: AppColor.scondary,
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r)
         ),
        
         fixedSize: Size(MediaQuery.of(context).size.width, 56.sp)
          ),
          child: Text(buttonName, style: TextStyle(color: Colors.white, fontFamily: "Poppins-Regular", fontSize: 18.sp),),
        );
  }
}
