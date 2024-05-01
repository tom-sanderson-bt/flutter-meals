import 'package:flutter/material.dart';
import 'package:meals/screens/filters.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withAlpha(80)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(children: [
              Icon(Icons.fastfood,
                  size: 48, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 10),
              Text(
                "Cooking Up!",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ]),
          ]),
        ),
        ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            }),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text(
            "Filters",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24,
                ),
          ),
          onTap: () async {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) {
                return const FiltersScreen();
              },
            ));
          },
        )
      ]),
    );
  }
}
