import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favourite_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key key}) : super(key: key);


  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String, Object>> _pages = [
    {
      'page' : CategoriesScreen(),
      'title': 'Categories',
      //can even send action button
     // 'actions' : [FlatButton(onPressed: onPressed, child: child)]
    },
    {
      'page' : FavouriteScreen(),
      'title': 'Your Favourite'
    }
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
  setState(() {
    _selectedPageIndex = index;
  });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer:MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          ),
        ],
      ),
    );
  }
}










// import 'package:flutter/material.dart';
// import './favourite_screen.dart';
// import './categories_screen.dart';
//
// class TabsScreen extends StatefulWidget {
//   const TabsScreen({Key key}) : super(key: key);
//
//   @override
//   _TabsScreenState createState() => _TabsScreenState();
// }
//
// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       //initialIndex: 0,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(tabs: <Widget>[
//             Tab(icon: Icon(Icons.category),text: 'Categories',),
//             Tab(icon: Icon(Icons.star), text: 'Favourites'),
//           ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             CategoriesScreen(),
//             FavouriteScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//









































