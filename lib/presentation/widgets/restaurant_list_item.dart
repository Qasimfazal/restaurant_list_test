import 'package:flutter/material.dart';
import 'package:restaurant_list_test/domain/entities/restaurant.dart';

class RestaurantListItem extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantListItem({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(restaurant.name),
    );
  }
}
