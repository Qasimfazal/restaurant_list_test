import 'package:restaurant_list_test/data/data_sources/restaurant_local_data_source.dart';
import 'package:restaurant_list_test/domain/entities/restaurant.dart';
import 'package:restaurant_list_test/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantLocalDataSource localDataSource;

  RestaurantRepositoryImpl(this.localDataSource);

  @override
  Future<List<Restaurant>> getRestaurants() async {
    final restaurantModels = await localDataSource.getRestaurantData();
    return restaurantModels
        .map((model) =>
            Restaurant(id: model.id, name: model.name, cuisine: model.cuisine))
        .toList();
  }
}
