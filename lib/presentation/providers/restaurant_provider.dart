import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_list_test/data/data_sources/restaurant_local_data_source.dart';
import 'package:restaurant_list_test/data/repositories/restaurant_repository_impl.dart';
import 'package:restaurant_list_test/domain/entities/restaurant.dart';
import 'package:restaurant_list_test/domain/repositories/restaurant_repository.dart';
import 'package:restaurant_list_test/domain/usecases/get_restaurant_list.dart';

final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  return RestaurantRepositoryImpl(ref.watch(restaurantLocalDataSourceProvider));
});

final restaurantProvider = FutureProvider<List<Restaurant>>((ref) async {
  final getRestaurantList =
      GetRestaurantList(ref.watch(restaurantRepositoryProvider));
  return getRestaurantList();
});

final restaurantLocalDataSourceProvider =
    Provider<RestaurantLocalDataSource>((ref) {
  return RestaurantLocalDataSource();
});
