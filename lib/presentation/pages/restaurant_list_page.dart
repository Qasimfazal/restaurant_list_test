import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_list_test/presentation/providers/restaurant_provider.dart';
import 'package:restaurant_list_test/presentation/widgets/restaurant_list_item.dart';
import 'package:restaurant_list_test/presentation/widgets/search_bar_widget.dart';

class RestaurantListPage extends ConsumerWidget {
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = ref.watch(restaurantProvider);
    final searchQuery = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Restaurant List')),
      body: Column(
        children: [
          const SearchBarWidget(),
          Expanded(
            child: restaurants.when(
              data: (data) {
                final filteredRestaurants = data
                    .where((restaurant) => restaurant.name
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase()))
                    .toList();
                return ListView.builder(
                  itemCount: filteredRestaurants.length,
                  itemBuilder: (context, index) {
                    return RestaurantListItem(
                        restaurant: filteredRestaurants[index]);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
