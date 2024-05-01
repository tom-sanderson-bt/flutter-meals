import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.allMeals});

  final List<Meal> allMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.forward();
  }

  void _selectCategory(BuildContext context, Category category) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: widget.allMeals
                .where((element) => element.categories.contains(category.id))
                .toList(),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
            padding: const EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 15,
            ),
            children: [
              for (Category cat in availableCategories)
                CategoryGridItem(
                  category: cat,
                  onSelectCategory: _selectCategory,
                )
            ]),
        builder: (BuildContext context, child) {
          return SlideTransition(
              position: Tween(
                begin: const Offset(0, 0.05),
                end: const Offset(0, 0),
              ).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.easeOut,
                ),
              ),
              child: child);
        });
  }
}
