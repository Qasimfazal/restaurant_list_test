import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider that manages the state of the search query.
final searchProvider = StateProvider<String>((ref) => '');

/// A widget that provides a search bar for filtering lists.
class SearchBarWidget extends ConsumerWidget {
  /// Constructor for [SearchBarWidget].
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          // Label text displayed in the search bar.
          labelText: 'Search',
          // Border styling for the search bar.
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          // Updates the search query in the [searchProvider] whenever the user types.
          ref.read(searchProvider.notifier).state = value;
        },
      ),
    );
  }
}
