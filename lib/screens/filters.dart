import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FilterItem extends ConsumerWidget {
  const FilterItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.filter});

  final String title;
  final String subTitle;
  final Filter filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterValue = ref.watch(filtersProvider)[filter]!;

    return SwitchListTile(
      value: filterValue,
      onChanged: (value) {
        ref.read(filtersProvider.notifier).setFilter(filter, value);
      },
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      subtitle: Text(subTitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
    );
  }
}

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your filters"),
      ),
      body: const Column(
        children: [
          FilterItem(
            filter: Filter.glutenFree,
            title: "Gluten Free",
            subTitle: "Shows only gluten free options",
          ),
          FilterItem(
            filter: Filter.lactoseFree,
            title: "Lactose Free",
            subTitle: "Shows only lactose free options",
          ),
          FilterItem(
            filter: Filter.vegetarian,
            title: "Vegetarian",
            subTitle: "Shows only vegetarian options",
          ),
          FilterItem(
            filter: Filter.vegan,
            title: "Vegan",
            subTitle: "Shows only vegan options",
          ),
        ],
      ),
    );
  }
}
