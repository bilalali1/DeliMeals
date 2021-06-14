import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';


  final Map<String, bool> currentFilters;
  final Function saveFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;


  @override
  initState(){
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
  }

  Widget _builderSwitchListTile(String title, String description, bool currentValue, Function updateValue)
  {
    return SwitchListTile(
        value:currentValue,
        title: Text(title),
        subtitle: Text(description),
        onChanged: updateValue,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: (){
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose':_lactoseFree,
              'vegan': _vegan,
              'vegetarian' : _vegetarian,
            };
            widget.saveFilters(selectedFilters);
          }),
        ],
      ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal selection',
              style:Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(child: ListView(
              children: [
                _builderSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals.',
                    _glutenFree,
                     (newValue){
                      setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _builderSwitchListTile(
                    'Lactose-free',
                    'Only include Lactose-free meals.',
                    _lactoseFree,
                        (newValue){
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),

                _builderSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian meals.',
                    _vegetarian,
                        (newValue){
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                _builderSwitchListTile(
                    'Vegan ',
                    'Only include vegan meals.',
                    _vegan,
                        (newValue){
                      setState(() {
                        _vegan = newValue;
                      });
                    }),

              ],
            )),
          ],
        ));
  }
}
