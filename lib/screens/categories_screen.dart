import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((catData) =>CategoryItem(
              catData.id,
              catData.title,
              catData.color
          )).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, //READ:: width of the tile: how many childs in row according to device size

            childAspectRatio: 3 / 2, //Read:: for 200 width i want 300 height

            //READ :: how much spacing between tiles in column and rowm
            crossAxisSpacing: 20,
            mainAxisSpacing:  20,
          ),
        //  itemBuilder: itemBuilder

    );
  }
}
