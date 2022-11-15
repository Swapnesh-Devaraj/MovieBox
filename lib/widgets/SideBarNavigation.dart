import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/Screens/loginScreen.dart';
import 'package:movies_flutter/auth/auth.dart';

class SideNavigation extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final Function onChanged;
  final int selectedIndex;
  SideNavigation({this.onChanged, this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Material(
        color: Colors.blue[900],
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                SizedBox(width: 20)
              ],
            ),
            UserAccountsDrawerHeader(
              currentAccountPictureSize: Size.square(100),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/sample1.jpeg"))),
              currentAccountPicture:
                  CircleAvatar(backgroundImage: NetworkImage(user.photoURL)),
              accountName: Text(
                user.displayName,
              ),
              accountEmail: Text(
                user.email,
              ),
            ),
            Container(
              color: selectedIndex == 0 ? Colors.blue[700] : Colors.blue[900],
              child: ListTile(
                title: Text("Movies", style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.movie, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                  onChanged(0);
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: selectedIndex == 1 ? Colors.blue[700] : Colors.blue[900],
              child: ListTile(
                  title:
                      Text("Wishlist", style: TextStyle(color: Colors.white)),
                  leading: Icon(Icons.favorite, color: Colors.white),
                  onTap: () {
                    Navigator.pop(context);
                    onChanged(1);
                  }),
            ),
            Divider(color: Colors.white),
            ListTile(
                title: Text("Log Out", style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.logout, color: Colors.white),
                onTap: () {
                  AuthService().signOut().then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(pageBuilder: (BuildContext context,
                            Animation animation, Animation secondaryAnimation) {
                          return LoginScreen();
                        }, transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(-1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        }),
                        (Route route) => false);
                  }).catchError((e) {
                    print(e);
                  });
                }),
          ],
        ),
      ),
    );
  }
}
