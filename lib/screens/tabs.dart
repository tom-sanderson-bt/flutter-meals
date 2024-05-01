import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabsScreen> {
  int _tabIndex = 0;

  _setTab(index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var filteredMeals = ref.watch(filteredMealsProvider);
    var favourites = ref.watch(favouritesProvider);

    Widget content = CategoriesScreen(allMeals: filteredMeals);
    String title = 'Categories';

    if (_tabIndex == 1) {
      content = MealsScreen(meals: favourites);
      title = "Your favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: _setTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourites",
          )
        ],
      ),
      body: content,
    );
  }
}
