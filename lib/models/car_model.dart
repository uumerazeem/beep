// To parse this JSON data, do
//
//     final carModel = carModelFromJson(jsonString);

import 'dart:convert';

List<CarModel> carModelFromJson(String str) => List<CarModel>.from(json.decode(str).map((x) => CarModel.fromJson(x)));

String carModelToJson(List<CarModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarModel {
    CarModel({
        this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating,
    });

    String? id;
    String? title;
    String? price;
    String? description;
    String? category;
    String? image;
    Rating? rating;

    factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        // rating: Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating!.toJson(),
    };
}

class Rating {
    Rating({
        this.rate,
        this.count,
    });

    double? rate;
    int? count;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
