import 'package:restaurant_list_test/domain/entities/restaurant.dart';
import 'package:restaurant_list_test/domain/repositories/restaurant_repository.dart';

class GetRestaurantList {
  final RestaurantRepository repository;

  GetRestaurantList(this.repository);

  Future<List<Restaurant>> call() {
    return repository.getRestaurants();
  }
}
