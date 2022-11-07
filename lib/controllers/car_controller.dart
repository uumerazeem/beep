import 'package:asignment/models/car_model.dart';
import 'package:asignment/services/car_service.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  var loading = false.obs;

  var carDataList =<CarModel>[].obs;

  CarService carService = CarService();

 @override
  void onInit() async {
    
    super.onInit();
    getCar();
  }

  getCar() async {
    try{
      loading(true);
    await carService.getMyCar().then((value) {
   

      carDataList.value = value;
    });
    }
    finally{
      loading(false);
    }
  }
}
