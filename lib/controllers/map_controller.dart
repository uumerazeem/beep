import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:ui' as ui;
import 'dart:ui';

class MapController extends GetxController {
  Completer<GoogleMapController> mapsController = Completer();
  
  double la = 0;
  double lo = 0;
  String lat = "";
  String? currentAddress;


  var buttonLoader = false.obs;
  Uint8List? marker;



// Starting point latitude
  double originLatitude = 30.3753;
// Starting point longitude
  double originLongitude = 69.3451;
// Destination latitude
  double destLatitude = 31.462199;
// Destination Longitude
  double destLongitude = 74.294221;

  Location location = Location();

  CameraPosition? kGooglePlex;
  RxMap<MarkerId, Marker> markers = RxMap();

  @override
  void onInit() {
    super.onInit();
    getInitialMapState();
  }

  //============ Get Initial State of Map ==========/////
  // same for every time
  getInitialMapState() {
    kGooglePlex = const CameraPosition(
      target: LatLng(31.510896644491066, 74.34064113799366),
      zoom: 14.4746,
    );
  }


  // ========== update Camera Position ============//
  updateCameraPosition() async {
    GoogleMapController map = await mapsController.future;
    map.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(la, lo), zoom: 14)));
  }


   //================ add Markers to the screen =========///

  addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: markerId,
      icon: descriptor,
      position: position,
    );
    // markers[markerId] = marker;

    markers[markerId] = marker;
  }

  /// ============ custom marker ============///

  static Future<Uint8List> getBytesFromAsset(
      String path, int width, int height) async {
    ByteData data = await rootBundle.load(path);

    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

}