import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return MealDetails(meal: meal);
            }),
          );
        },
        splashColor: Theme.of(context).primaryColor,
        child: Hero(
          tag: meal.id,
          child: Stack(
            children: [
              FadeInImage(
                height: 200,
                width: double.infinity,
                placeholder: MemoryImage(kTransparentImage),
                fit: BoxFit.cover,
                image: NetworkImage(meal.imageUrl),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.black54,
                  child: Text(
                    meal.title,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
