
import 'package:asignment/screens/tabscreen/mycar_screen.dart';
import 'package:asignment/utils/app_colors.dart';
import 'package:asignment/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/map_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MapController mapController = Get.put(MapController());



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
                  sunWidget(),
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
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  
                ),
            
                child: Stack(children: [
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
            
                ],),
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

  Widget sunWidget() {
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
              child: Image(
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
                  '40 C',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Riyadh',
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
