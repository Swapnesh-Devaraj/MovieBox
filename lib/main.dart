import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/Screens/loginScreen.dart';
import '/Screens/MoviesScreen.dart';
import '/Screens/homeScreen.dart';
import 'widgets/sideBarNavigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Assignment App",
      home: LoginScreen(),
    );
  }
}

class MyHome extends StatefulWidget {
  final int screenIndex;
  MyHome({this.screenIndex});
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    MoviesScreen(),
  ];
  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 50,
        ),
        drawer: SideNavigation(onChanged: onTap),
        body: screens.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue[900],
          items: [
            BottomNavigationBarItem(
              label: "HOME",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "MOVIES",
              icon: Icon(
                Icons.movie,
              ),
            )
          ],
          currentIndex: selectedIndex,
          onTap: onTap,
        ),
      ),
    );
  }
}
