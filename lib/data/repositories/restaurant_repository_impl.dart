import 'package:restaurant_list_test/data/data_sources/restaurant_local_data_source.dart';
import 'package:restaurant_list_test/domain/entities/restaurant.dart';
import 'package:restaurant_list_test/domain/repositories/restaurant_repository.dart';

/// Implementation of the [RestaurantRepository] interface.
///
/// This class interacts with the [RestaurantLocalDataSource] to fetch
/// restaurant data and map it to the [Restaurant] entity.
class RestaurantRepositoryImpl implements RestaurantRepository {
  /// The local data source used to fetch raw restaurant data.
  final RestaurantLocalDataSource localDataSource;

  /// Constructor for [RestaurantRepositoryImpl].
  ///
  /// Requires a [RestaurantLocalDataSource] instance to be passed in.
  RestaurantRepositoryImpl(this.localDataSource);

  /// Fetches a list of restaurants from the local data source.
  ///
  /// Calls [localDataSource.getRestaurantData] to retrieve raw data and maps
  /// it to a list of [Restaurant] entities.
  ///
  /// Returns a [Future] that completes with a [List<Restaurant>].
  @override
  Future<List<Restaurant>> getRestaurants() async {
    // Fetches raw restaurant data from the local data source.
    final restaurantModels = await localDataSource.getRestaurantData();
    // Maps the raw data to [Restaurant] entities and returns the list.
    return restaurantModels
        .map((model) =>
            Restaurant(id: model.id, name: model.name, cuisine: model.cuisine))
        .toList();
  }
}
