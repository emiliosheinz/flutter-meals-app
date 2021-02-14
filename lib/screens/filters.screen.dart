import 'package:flutter/material.dart';
import 'package:meals_app/components/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';

  const FiltersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filtes')),
      body: Center(
        child: Text('FiltersScreen'),
      ),
      drawer: MainDrawer(),
    );
  }
}
