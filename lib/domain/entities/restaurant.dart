/// A class representing a restaurant entity.
///
/// This class holds information about a restaurant, including its ID, name, and cuisine.
class Restaurant {
  /// The unique identifier for the restaurant.
  final int id;

  /// The name of the restaurant.
  final String name;

  /// The type of cuisine served by the restaurant.
  final String cuisine;

  /// Constructor for [Restaurant].
  ///
  /// Requires an [id], [name], and [cuisine] to be passed in.
  Restaurant({required this.id, required this.name, required this.cuisine});
}
