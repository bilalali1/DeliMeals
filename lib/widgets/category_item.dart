import 'package:flutter/material.dart';
import 'package:foodi_flutter/screens/categories_screen.dart';
import 'package:foodi_flutter/screens/category_meals_screen.dart';
import '../dummy_data.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id,this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(
        CategoryMealsScreen.routeName,
        arguments: {
          'id': id,
          'title': title
        }
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
             ),
            borderRadius: BorderRadius.circular(15),
      ),

      ),
    );
  }
}
