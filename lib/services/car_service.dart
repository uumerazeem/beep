import 'dart:convert';
import 'dart:developer';

import 'package:asignment/models/car_model.dart';
import 'package:http/http.dart' as http;

class CarService {
  Future<List<CarModel>> getMyCar() async {
    List<CarModel> carData = [];
    try {
      var response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));
      var data = jsonDecode(response.body);
      List<dynamic> parsedList = [];
 
      if (response.statusCode == 200) {
        parsedList = data;

        // carData = List<CarModel>.from(parsedList.map((e) {
        //   CarModel.fromJson(e);
        // }));
        
        for(int i = 0; i<parsedList.length;i++)
        {
          carData.add(CarModel(
            category: parsedList[i]["category"].toString(),
            id: parsedList[i]["id"].toString(),
            description: parsedList[i]["description"].toString(),
            image: parsedList[i]["image"].toString(),
            price:parsedList[i]["price"].toString(), 
            title: parsedList[i]["title"].toString(), 
          ));
        }
        

        // log(" the length of list " + List<CarModel>.from(parsedList.map((e) {
        //   CarModel.fromJson(e);
        // })).length.toString());
      } else {
        carData = [];
      }
    } catch (e) {
      carData = [];
    }
    return carData;
  }
}

