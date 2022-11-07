import 'dart:developer';

import 'package:asignment/controllers/car_controller.dart';
import 'package:asignment/models/car_model.dart';
import 'package:asignment/utils/app_colors.dart';
import 'package:asignment/utils/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyCarsScreen extends StatefulWidget {
  const MyCarsScreen({super.key});

  @override
  State<MyCarsScreen> createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen> {
  CarController carController = Get.put(CarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 70.0,
              left: 20.0,
              // right: 20.0,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                Text(
                  'My Cars',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
                // Expanded(child: Container()),
                Container(
                  width: 160,
                ),
                Container(
                  width: 75,
                  height: 34,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: AppColor.scondary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                )
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
                child: Obx(() {
                  return carController.loading.value == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColor.scondary,
                          ),
                        )
                      : carController.carDataList.length == 0
                          ? Center(
                              child: Text("No data.."),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.r),
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: carController.carDataList.length,
                                  itemBuilder: (context, index) {
                                    CarModel data =
                                        carController.carDataList[index];
                                    return singleWidget(data.image, data.title!, data.price!);
                                  }),
                            );
                })),
          ),
        
        
        ],
      ),
    );
  }

  Widget singleWidget(String? image ,String title, String price) {
    log(image!);
    return Container(
      width: 390,
      height: 131,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              height: 106.h,
              width: 106.w,
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageUrl: "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
              placeholder: (context, url) => CircularProgressIndicator(
                color: Colors.grey,
              ),
            ),
          ),
          // Image(
          //   image: AssetImage(AppImages.bmwimage),
          // ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              firstWidget(title),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  secondWidget(),
                  SizedBox(
                    width: 30,
                  ),
                  thirdWidget(
                    'Price',
                    price,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  thirdWidget(
                    'Year',
                    '2022',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget firstWidget(String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image(
              image: AssetImage(
                AppImages.bmwicon,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 200.w,
              child: Text(
                '$title',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '7 Series',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        )
      ],
    );
  }

  Widget secondWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: TextStyle(
            color: AppColor.scondary,
            fontSize: 12,
          ),
        ),
        Row(
          children: [
            Image(
              image: AssetImage(
                AppImages.carIcon,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Block',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget thirdWidget(String heading, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
            color: AppColor.scondary,
            fontSize: 12,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
