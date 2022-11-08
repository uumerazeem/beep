
  import 'dart:convert';
import 'dart:developer';

import 'package:asignment/models/car_model.dart';
import 'package:http/http.dart' as http;

class Weather{
 Future<dynamic>  getWeather(String cityName)async{
Map<String, dynamic> data={};
    var response = await http.get(Uri.parse("https://api.weatherapi.com/v1/current.json?key=e1db04dc4d474ee8b2b125004220811%20&q=$cityName&aqi=no"));
    if(response.statusCode == 200)
    {  var data2 =jsonDecode(response.body);
     
       data= {
        "region": data2["location"]["region"],
        "current": data2["current"]["temp_c"],
        "icon": data2["current"]["condition"]["icon"],
       };
       log(data.toString());
    }
    else{
      data={};

    }
    return data;

  }

}