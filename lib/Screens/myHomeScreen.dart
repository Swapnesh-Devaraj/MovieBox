import 'package:flutter/material.dart';
import 'package:movies_flutter/Screens/MoviesScreen.dart';
import 'package:movies_flutter/Screens/wishList.dart';
import 'package:movies_flutter/widgets/sideBarNavigation.dart';

class MyHome extends StatefulWidget {
  final int screenIndex;
  MyHome({this.screenIndex});
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int selectedIndex = 0;
  List<Widget> screens = [
    MoviesScreen(),
    WishList(),
  ];
  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        toolbarHeight: 50,
      ),
      drawer: SideNavigation(
        onChanged: onTap,
        selectedIndex: selectedIndex,
      ),
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[900],
        items: [
          BottomNavigationBarItem(
            label: "MOVIES",
            icon: Icon(
              Icons.movie,
            ),
          ),
          BottomNavigationBarItem(
            label: "WISHLIST",
            icon: Icon(
              Icons.favorite,
            ),
          )
        ],
        currentIndex: selectedIndex,
        onTap: onTap,
      ),
    );
  }
}
