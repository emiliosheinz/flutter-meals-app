import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = arguments['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingedients'),
            buildContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: selectedMeal.ingredients
                    .map((ingedient) => Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              ingedient,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: selectedMeal.steps
                    .map((step) => Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: Text(
                                    '#${selectedMeal.steps.indexOf(step) + 1}'),
                              ),
                              title: Text(step),
                            ),
                            Divider()
                          ],
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(id);
        },
      ),
    );
  }
}
