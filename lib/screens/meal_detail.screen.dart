import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = arguments['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal'),
      ),
      body: Center(
        child: Text('Meal Detail $id'),
      ),
    );
  }
}
