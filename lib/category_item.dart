import 'package:flutter/material.dart';
import 'package:meals_app/category_meals.screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CategoryMealsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius defaultBoderRaidus = BorderRadius.circular(15);

    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: defaultBoderRaidus,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: defaultBoderRaidus,
        ),
      ),
    );
  }
}
