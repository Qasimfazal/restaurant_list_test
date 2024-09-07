import 'package:restaurant_list_test/domain/entities/restaurant.dart';
import 'package:restaurant_list_test/domain/repositories/restaurant_repository.dart';

/// A use case class responsible for fetching the list of restaurants.
///
/// This class interacts with the [RestaurantRepository] to retrieve the
/// list of restaurants.
class GetRestaurantList {
  /// The repository used to fetch restaurant data.
  final RestaurantRepository repository;

  /// Constructor for [GetRestaurantList].
  ///
  /// Requires a [RestaurantRepository] instance to be passed in.
  GetRestaurantList(this.repository);

  /// Fetches the list of restaurants from the repository.
  ///
  /// Returns a [Future] that completes with a [List<Restaurant>].
  Future<List<Restaurant>> call() {
    return repository.getRestaurants();
  }
}
