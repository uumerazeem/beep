import 'package:asignment/controllers/map_controller.dart';
import 'package:asignment/screens/tabscreen/charge_screen.dart';
import 'package:asignment/screens/tabscreen/home.dart';
import 'package:asignment/screens/tabscreen/mycar_screen.dart';
import 'package:asignment/utils/app_colors.dart';
import 'package:asignment/utils/app_icons.dart';
import 'package:asignment/utils/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

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
  MapController mapController = Get.put(MapController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpermission();
  }

  bool isenable = false;
  Future<void> getpermission() async {
    setState(() {
      if (mounted) {
        isenable = true;
      }
    });

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await mapController.location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await mapController.location.requestService();
      if (!_serviceEnabled) {
        setState(() {
          if (mounted) {
            isenable = false;
          }
        });
        return;
      } else {
        setState(() {
          if (mounted) {
            isenable = false;
          }
        });
        return;
      }
    }

    _permissionGranted = await mapController.location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await mapController.location.requestPermission();
      if (_permissionGranted == PermissionStatus.granted ||
          _permissionGranted == PermissionStatus.grantedLimited) {
        setState(() {
          if (mounted) {
            isenable = false;
          }
        });
        return;
      } else {
        setState(() {
          if (mounted) {
            isenable = false;
          }
        });
        return;
      }
    } else {
      setState(() {
        if (mounted) {
          isenable = false;
        }
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isenable == true
          ? Center(
              child: CircularProgressIndicator(
                color: AppColor.primary,
              ),
            )
          : Stack(
              children: [
                Expanded(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 600),
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
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                selectedIndex = 0;
                              });
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.r),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(AppIcon.home,
                                    height: 30.h,
                                    width: 34.w,
                                    color: selectedIndex == 0
                                        ? Colors.white
                                        : Color(0xff9997FC)),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      color: selectedIndex == 0
                                          ? Colors.white
                                          : Color(0xff9997FC),
                                      fontFamily: "Poppins-Regular",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                selectedIndex = 1;
                              });
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.r),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(AppIcon.calendar_month,
                                    height: 30.h,
                                    width: 34.w,
                                    color: selectedIndex == 1
                                        ? Colors.white
                                        : Color(0xff9997FC)),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      color: selectedIndex == 1
                                          ? Colors.white
                                          : Color(0xff9997FC),
                                      fontFamily: "Poppins-Regular",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                selectedIndex = 2;
                              });
                            }
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
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                selectedIndex = 3;
                              });
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.r),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(AppIcon.car,
                                    height: 30.h,
                                    width: 34.w,
                                    color: selectedIndex == 3
                                        ? Colors.white
                                        : Color(0xff9997FC)),
                                Text(
                                  "Cars",
                                  style: TextStyle(
                                      color: selectedIndex == 3
                                          ? Colors.white
                                          : Color(0xff9997FC),
                                      fontFamily: "Poppins-Regular",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                selectedIndex = 4;
                              });
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.r),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(AppIcon.person3,
                                    height: 30.h,
                                    width: 34.w,
                                    color: selectedIndex == 4
                                        ? Colors.white
                                        : Color(0xff9997FC)),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                      color: selectedIndex == 4
                                          ? Colors.white
                                          : Color(0xff9997FC),
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
