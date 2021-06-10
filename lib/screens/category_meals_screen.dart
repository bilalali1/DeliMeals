import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;

  var  _loadedInitData = false;
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
    if(!_loadedInitData) {
      final routesArgs = ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      final categoryId = routesArgs['id'];
      categoryTitle = routesArgs['title'];
      displayedMeals =
          DUMMY_MEALS.where((meal) => meal.categories.contains(categoryId))
              .toList();
    }
    _loadedInitData = true;
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: displayedMeals.length,
            itemBuilder: (ctx,index){
              return MealItem(
                id: displayedMeals[index].id,
                  title: displayedMeals[index].title,
                  imageUrl: displayedMeals[index].imageUrl,
                  affordability: displayedMeals[index].affordability,
                  complexity: displayedMeals[index].complexity,
                  duration: displayedMeals[index].duration,
                  removeItem: _removeMeal,
              );
        }),
      ),
    );
  }
}
