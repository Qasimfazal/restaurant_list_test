import 'package:flutter/material.dart';
import 'package:restaurant_list_test/domain/entities/restaurant.dart';

/// A widget that displays a card for a restaurant with its name and cuisine.
class RestaurantListCard extends StatelessWidget {
  /// The [Restaurant] object that this card will display.
  final Restaurant restaurant;

  /// Constructor for [RestaurantListCard].
  ///
  /// Requires a [restaurant] object to be passed in.
  const RestaurantListCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Adds margin around the card.
      margin: const EdgeInsets.all(8),
      // Adds padding inside the card.
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // Rounded corners for the card.
        borderRadius: BorderRadius.circular(8),
        // Background color with some opacity.
        color: Colors.indigoAccent.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Displays the restaurant's name.
          Text(
            restaurant.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Displays the restaurant's cuisine.
          Text(
            restaurant.cuisine,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
