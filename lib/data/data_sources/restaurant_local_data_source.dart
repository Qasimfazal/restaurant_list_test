import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:restaurant_list_test/core/config.dart';
import 'package:restaurant_list_test/data/models/restaurant_model.dart';

/// A data source class responsible for loading restaurant data from local JSON files.
///
/// This class retrieves restaurant data from a local JSON file and maps it to
/// [RestaurantModel] instances.
class RestaurantLocalDataSource {
  /// Fetches restaurant data from a local JSON file.
  ///
  /// Reads the JSON file specified by [jsonPath], decodes the JSON data,
  /// and maps it to a list of [RestaurantModel] instances.
  ///
  /// Returns a [Future] that completes with a [List<RestaurantModel>].
  Future<List<RestaurantModel>> getRestaurantData() async {
    // Load the JSON file from the assets.
    final jsonString = await rootBundle.loadString(jsonPath);
    // Decode the JSON string into a list of dynamic objects.
    final List<dynamic> jsonData = json.decode(jsonString);
    // Map each JSON object to a [RestaurantModel] instance and return the list.
    return jsonData.map((json) => RestaurantModel.fromJson(json)).toList();
  }
}
