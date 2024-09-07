import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_list_test/data/data_sources/restaurant_local_data_source.dart';
import 'package:restaurant_list_test/data/repositories/restaurant_repository_impl.dart';
import 'package:restaurant_list_test/domain/entities/restaurant.dart';
import 'package:restaurant_list_test/domain/repositories/restaurant_repository.dart';
import 'package:restaurant_list_test/domain/usecases/get_restaurant_list.dart';

/// Provider for [RestaurantRepository].
///
/// This provider creates an instance of [RestaurantRepositoryImpl] using
/// [restaurantLocalDataSourceProvider] to provide the local data source.
final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  return RestaurantRepositoryImpl(ref.watch(restaurantLocalDataSourceProvider));
});

/// Provider for fetching the list of restaurants.
///
/// This provider uses [GetRestaurantList] use case to fetch the list of
/// restaurants from the [RestaurantRepository] and returns a [Future] of
/// [List<Restaurant>].
final restaurantProvider = FutureProvider<List<Restaurant>>((ref) async {
  final getRestaurantList =
      GetRestaurantList(ref.watch(restaurantRepositoryProvider));
  return getRestaurantList();
});

/// Provider for [RestaurantLocalDataSource].
///
/// This provider creates an instance of [RestaurantLocalDataSource] to be
/// used by the repository.
final restaurantLocalDataSourceProvider =
    Provider<RestaurantLocalDataSource>((ref) {
  return RestaurantLocalDataSource();
});
