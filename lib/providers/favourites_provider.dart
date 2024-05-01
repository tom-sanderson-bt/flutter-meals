import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meals.dart';

class FavouritesNotifier extends StateNotifier<List<Meal>> {
  FavouritesNotifier() : super([]);

  bool toggleFavourite(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, List<Meal>>(
        (ref) => FavouritesNotifier());
