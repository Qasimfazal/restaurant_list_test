import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_list_test/presentation/providers/restaurant_provider.dart';
import 'package:restaurant_list_test/presentation/widgets/restaurant_list_card.dart';
import 'package:restaurant_list_test/presentation/widgets/search_bar_widget.dart';

/// A [ConsumerWidget] that displays a list of restaurants with a search bar.
class RestaurantListPage extends ConsumerWidget {
  /// Constructor for [RestaurantListPage].
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider for the list of restaurants.
    final restaurants = ref.watch(restaurantProvider);

    // Watch the provider for the current search query.
    final searchQuery = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant List'),
      ),
      body: Column(
        children: [
          // A widget for the search bar.
          const SearchBarWidget(),

          // Expanded widget to ensure the ListView takes up available space.
          Expanded(
            child: restaurants.when(
              // When data is successfully fetched.
              data: (data) {
                // Filter the list of restaurants based on the search query.
                final filteredRestaurants = data
                    .where((restaurant) =>
                        restaurant.name
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase()) ||
                        restaurant.cuisine
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase()) ||
                        restaurant.id
                            .toString()
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase()))
                    .toList();

                // Display a message if no data is found.
                if (filteredRestaurants.isEmpty) {
                  return const Center(
                    child: Text(
                      'No data found',
                      style: TextStyle(fontSize: 18, color: Colors.redAccent),
                    ),
                  );
                }

                // Display the list using Card Widget and  filtered list of restaurants.
                return ListView.builder(
                  itemCount: filteredRestaurants.length,
                  itemBuilder: (context, index) {
                    return RestaurantListCard(
                        restaurant: filteredRestaurants[index]);
                  },
                );
              },
              // While the data is loading.
              loading: () => const Center(child: CircularProgressIndicator()),
              // If an error occurs during data fetching.
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
