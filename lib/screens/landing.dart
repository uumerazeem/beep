import 'package:asignment/screens/tabscreen/charge_screen.dart';
import 'package:asignment/screens/tabscreen/home.dart';
import 'package:asignment/screens/tabscreen/mycar_screen.dart';
import 'package:asignment/utils/app_colors.dart';
import 'package:asignment/utils/app_icons.dart';
import 'package:asignment/utils/bottombar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingScreen extends StatefulWidget {
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<Widget> listWidget = [
    HomeScreen(),
    HomeScreen(),
    ChargeScreen(),
    MyCarsScreen(),
   ChargeScreen(),
  ];

  int selectedIndex = 0;
 
  late AnimationController bouncingController;

  late Animation bouncingAnimation;


  bool touchedFloor = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body:Stack(
          children: [
            Expanded(
              child: AnimatedSwitcher(duration: Duration(milliseconds: 600),
              child: listWidget[selectedIndex],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomPaint(
                      size: Size(
                MediaQuery.of(context).size.width,
                (MediaQuery.of(context).size.width * 0.2441860465116279)
                    .toDouble()),
                      painter: RPSCustomPainter(),
                      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex=0;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          AppIcon.home,
                          height: 30.h,
                          width: 34.w,
                           color: 
                          selectedIndex==0? Colors.white: Color(0xff9997FC)
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                               color: 
                          selectedIndex==0? Colors.white: Color(0xff9997FC),
                              fontFamily: "Poppins-Regular",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex=1;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          AppIcon.calendar_month,
                          height: 30.h,
                          width: 34.w,
                          color: 
                          selectedIndex==1? Colors.white: Color(0xff9997FC)
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                               color: 
                          selectedIndex==1? Colors.white: Color(0xff9997FC),
                              fontFamily: "Poppins-Regular",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ),
               GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex=3;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15.0.r),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 14),
                              blurRadius: 14,
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1)
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: AppColor.scondary,
                        radius: 45.r,
                        child: Text(
                          "BOOK",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins-Regular",
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex=3;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          AppIcon.car,
                          height: 30.h,
                          width: 34.w,
                           color: 
                          selectedIndex==3? Colors.white: Color(0xff9997FC)
                        ),
                        Text(
                          "Cars",
                          style: TextStyle(
                               color: 
                          selectedIndex==3? Colors.white: Color(0xff9997FC),
                              fontFamily: "Poppins-Regular",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex=4;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          AppIcon.person3,
                          height: 30.h,
                          width: 34.w,
                           color: 
                          selectedIndex==4? Colors.white: Color(0xff9997FC)
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                               color: 
                          selectedIndex==4? Colors.white: Color(0xff9997FC),
                              fontFamily: "Poppins-Regular",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
                      ),
                    ),
            )

          ],
        ),
        
        // ConvexAppBar(
        //   style: TabStyle.fixed,

        //   items: [
        //     TabItem(icon: Icons.list),
        //     TabItem(icon: CircleAvatar(
        //       backgroundColor: AppColor.scondary,
        //       radius: 64.r,

        //     )
        //     ),
        //     TabItem(icon: Icons.assessment),
        //   ],
        //   initialActiveIndex: 1,
        //   onTap: (int i) => print('click index=$i'),
        // ),

        );
  }
}
