import 'dart:convert';

import 'restaurant_model.dart';

RestaurantList restaurantListFromJson(String str) =>
    RestaurantList.fromJson(json.decode(str));

String restaurantListToJson(RestaurantList data) => json.encode(data.toJson());

class RestaurantList {
  bool error;
  String message;
  int count;
  List<Restaurant> restaurant;

  RestaurantList({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurant,
  });

  factory RestaurantList.fromJson(Map<String, dynamic> json) => RestaurantList(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurant: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurant.map((x) => x.toJson())),
      };
}
