import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/widgets/filter_item.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          FilterItem(
            value: activeFilters[Filter.glutenFree]!,
            action: (isChecked) =>
                ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree),
            label: 'Gluten-Free',
            subtitle: 'Only include gluten-free meals.',
          ),
          FilterItem(
            value: activeFilters[Filter.lactoseFree]!,
            action: (isChecked) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree),
            label: 'Lactose-Free',
            subtitle: 'Only include lactose-free meals.',
          ),
          FilterItem(
            value: activeFilters[Filter.vegetarian]!,
            action: (isChecked) =>
                ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian),
            label: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
          ),
          FilterItem(
            value: activeFilters[Filter.vegan]!,
            action: (isChecked) =>
                ref.read(filtersProvider.notifier).setFilter(Filter.vegan),
            label: 'Vegan',
            subtitle: 'Only include vegan meals.',
          ),
        ],
      ),
    );
  }
}
