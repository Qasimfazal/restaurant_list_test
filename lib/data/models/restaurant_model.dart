/// A model class representing a restaurant.
///
/// This class is used to map JSON data to the [RestaurantModel] entity and
/// to convert the [RestaurantModel] instance to JSON format.
class RestaurantModel {
  /// The unique identifier for the restaurant.
  final int id;

  /// The name of the restaurant.
  final String name;

  /// The type of cuisine served by the restaurant.
  final String cuisine;

  /// Constructor for [RestaurantModel].
  ///
  /// Requires an [id], [name], and [cuisine] to be passed in.
  RestaurantModel({
    required this.id,
    required this.name,
    required this.cuisine,
  });

  /// Creates a [RestaurantModel] instance from a JSON map.
  ///
  /// The [json] parameter should be a map with string keys and dynamic values,
  /// and should contain 'id', 'name', and 'cuisine' fields.
  ///
  /// Returns a new instance of [RestaurantModel].
  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      cuisine: json['cuisine'],
    );
  }

  /// Converts the [RestaurantModel] instance to a JSON map.
  ///
  /// Returns a map with string keys and dynamic values, containing 'id', 'name',
  /// and 'cuisine' fields.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cuisine': cuisine,
    };
  }
}

// Example Data from JSON
// [
//     {
//         "id": 1,
//         "name": "The Smokehouse",
//         "cuisine": "Barbecue"
//     },
//     {
//         "id": 2,
//         "name": "Pinocchio's Pizza",
//         "cuisine": "Italian"
//     },
//     {
//         "id": 3,
//         "name": "Felipe's Taqueria",
//         "cuisine": "Mexican"
//     },
//     {
//         "id": 4,
//         "name": "Tasty Burger",
//         "cuisine": "American"
//     }
// ]
