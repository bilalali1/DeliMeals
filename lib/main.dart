import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './models/meal.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose':false,
    'vegan': false,
    'vegetarian' : false,

  };

  List<Meal> _availableMeas = DUMMY_MEALS;
  List<Meal> _favourtieMeals = [];

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;
    _availableMeals = DUMMY_MEALS.where((meal){
      if(_filters['gluten'] && !meal.isGlutenFree) {
        return false;
      }
      if(_filters['lactose'] && !meal.isLactoseFree) {
        return false;
      }
      if(_filters['vegan'] && !meal.isVegan) {
        return false;
      }
      if(_filters['vegetarian'] && !meal.isVegetarian) {
        return false;
      }
      return true;
      }).toList();

    });
  }

  List<Meal> _availableMeals =DUMMY_MEALS;

  void _toggleFavourite(String mealId){
    final existingIndex =
        _favourtieMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favourtieMeals.removeAt(existingIndex);
      });
    } else{
      setState(() {
        _favourtieMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });

    }
  }
  bool isMealFavourite(String id){
    return _favourtieMeals.any((meal) => meal.id == id);
  }






  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dELIfOOD',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
         title: TextStyle(
            fontSize: 24.0,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
     // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favourtieMeals),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavourite, isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters,_setFilters),
      },
      onGenerateRoute: (settings){
        print(settings.arguments);
        // if(settings.name == '/meal-detail'){
        //   return ...;}
        //   else if (settings.name == '/meal-detail'){
        //     return ...;
        // }
        //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        },

      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
     );
  }
}
