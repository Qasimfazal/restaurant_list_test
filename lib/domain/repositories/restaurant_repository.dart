import 'package:restaurant_list_test/domain/entities/restaurant.dart';

/// An abstract class that defines the contract for a restaurant repository.
///
/// This repository is responsible for fetching restaurant data.
abstract class RestaurantRepository {
  /// Fetches a list of restaurants.
  ///
  /// This method is expected to return a [Future] that completes with a
  /// [List<Restaurant>]. The implementation of this method should handle
  /// the actual data retrieval logic.
  Future<List<Restaurant>> getRestaurants();
}
