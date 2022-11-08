import 'dart:developer';

import 'package:asignment/screens/tabscreen/mycar_screen.dart';
import 'package:asignment/services/weather_service.dart';
import 'package:asignment/utils/app_colors.dart';
import 'package:asignment/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/map_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MapController mapController = Get.find();
Map<String,dynamic>? weatherData = {};
  getCityName(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        lat,
        lng,
      );
      Placemark placemark = placemarks[0];
      log(placemark.country.toString());

       weatherData = await Weather().getWeather(placemark.country.toString());
      log("in the " + weatherData.toString());
    } catch (err) {}
  }

  int count = 0;
  mapListener() async {
    mapController.marker =
        await MapController.getBytesFromAsset(AppImages.marker, 60, 100);
    mapController.location.onLocationChanged.listen((l) async {
      // if (isNavigationStarted == true) {
      //   print("Navigation is started");
      //   mapController.getPolyline();
      //   mapController.geoDistance.value = Geolocator.distanceBetween(
      //       l.latitude!,
      //       l.longitude!,
      //       mapController.destLatitude,
      //       mapController.destLongitude);
      //   if (mapController.geoDistance.value < 30.0) {
      //     if (counter == 2) {
      //       isNavigationStarted = false;
      //     } else if (counter == 3) {
      //       isNavigationStarted = false;
      //       counter++;
      //     }
      //   } else {}
      // } else {
      //   print("Navigation is not started");
      // }

      mapController.addMarker(
          LatLng(l.latitude!, l.longitude!),
          "origin",
          // currentIcon,
          BitmapDescriptor.fromBytes(mapController.marker!));
      mapController.la = l.latitude!;
      mapController.lo = l.longitude!;
      mapController.updateCameraPosition();
      if (count == 0) {
        getCityName(l.latitude!, l.longitude!);
      }
      count++;
    });
  }

  Map<MarkerId, Marker> markers = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mapListener();
    markerListener();
  }
 
  markerListener() {
    mapController.markers.listen((p0) {
      if (this.mounted) {
        setState(() {
          markers = p0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      // appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Get.to(MyCarsScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  imageWidget(),
               weatherData!["current"].toString() =="null"?
               SizedBox()
               :   sunWidget(weatherData!["current"].toString(), weatherData!["region"].toString()),
                ],
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Stack(
                  children: [

                    GoogleMap(
                      
                      zoomControlsEnabled: false,
                      mapType: MapType.terrain,
                      scrollGesturesEnabled: true,
                      markers: Set<Marker>.of(markers.values),
                      initialCameraPosition: mapController.kGooglePlex!,
                      onMapCreated: (GoogleMapController controller) {
                        mapController.mapsController.complete(controller);
                      },
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Row(
                        children: [
                          GestureDetector(
                          onTap: (){
                              
                          },
                          child: Container(
                            height: 34,
                            width: 34,
                            decoration: BoxDecoration(
                              color: AppColor.scondary,
                              borderRadius: BorderRadius.circular(5.r)
                                            
                            ),
                            child: Icon(Icons.search, color: Colors.white,),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        GestureDetector(
                          onTap: ()async{
                          await  mapController.updateCameraPosition();
                            
                          
                              
                          },
                          child: Container(
                            height: 34,
                            width: 34,
                            decoration: BoxDecoration(
                              color: AppColor.scondary,
                              borderRadius: BorderRadius.circular(5.r)
                                            
                            ),
                            child: Icon(Icons.star, color: Colors.white,),
                          ),
                        ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      right: 10,
                      child: GestureDetector(
                        onTap: (){
                        
                        },
                        child: Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: AppColor.scondary,
                            borderRadius: BorderRadius.circular(5.r)
                                          
                          ),
                          child: Icon(Icons.my_location, color: Colors.white,),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageWidget() {
    return Row(
      children: [
        Image(
          image: AssetImage(AppImages.personImage),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style: TextStyle(
                color: AppColor.offWhite,
              ),
            ),
            Text(
              'Abdullah!',
              style: TextStyle(
                color: AppColor.offWhite,
                fontSize: 21,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.markunread_sharp,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Riyadh',
                  style: TextStyle(
                    color: AppColor.offWhite,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget sunWidget(
    String degree,
    String region
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 138,
          height: 44,
          decoration: BoxDecoration(
            color: AppColor.scondary,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.wallet,
                size: 30,
                color: Colors.white,
              ),
              Text(
                '128 SAR',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child:
              
              
               Image(
                image: AssetImage(AppImages.sunImage),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$degree C',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '$region',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
