import 'package:flutter/material.dart';
import 'package:meals_app/components/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegeterian = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFilters['isGlutenFree'];
    _isLactoseFree = widget.currentFilters['isLactoseFree'];
    _isVegan = widget.currentFilters['isVegan'];
    _isVegeterian = widget.currentFilters['isVegeterian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      {String title, String description, bool value, Function onChange}) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(description),
      onChanged: onChange,
    );
  }

  void _showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Filters saved successfully"),
      content: Text("Go back to te meals section to see the filtered result."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filtes'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.saveFilters({
                  'isGlutenFree': _isGlutenFree,
                  'isLactoseFree': _isLactoseFree,
                  'isVegan': _isVegan,
                  'isVegeterian': _isVegeterian,
                });
                _showAlertDialog(context);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    title: 'Gluten-free',
                    description: 'Only include gluten-free meals',
                    value: _isGlutenFree,
                    onChange: (newValue) {
                      setState(() {
                        _isGlutenFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    title: 'Lactose-free',
                    description: 'Only include lactose-free meals',
                    value: _isLactoseFree,
                    onChange: (newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    title: 'Vegeterian',
                    description: 'Only include vegeterian meals',
                    value: _isVegeterian,
                    onChange: (newValue) {
                      setState(() {
                        _isVegeterian = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    title: 'Vagan',
                    description: 'Only include vegan meals',
                    value: _isVegan,
                    onChange: (newValue) {
                      setState(() {
                        _isVegan = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
