import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:restaurant_list_test/core/error/failures.dart';
import 'package:restaurant_list_test/data/models/restaurant_model.dart';

class RestaurantLocalDataSource {
  Future<List<RestaurantModel>> getRestaurantData() async {
    final jsonString = await rootBundle.loadString(jsonPath);
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((json) => RestaurantModel.fromJson(json)).toList();
  }
}
