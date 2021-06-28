// import 'package:flutter/material.dart';
// import 'package:movies_flutter/Screens/MoviesScreen.dart';
// import 'package:movies_flutter/Screens/homeScreen.dart';
// import 'package:movies_flutter/main.dart';

// class SideBarNavigation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Material(
//         color: Theme.of(context).primaryColor,
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: ListView(
//             children: <Widget>[
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   IconButton(
//                       onPressed: () => Navigator.pop(context),
//                       icon: Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                       )),
//                   SizedBox(width: 20)
//                 ],
//               ),
//               SizedBox(height: 20),
//               listItem(
//                   text: "Home",
//                   icon: Icons.home,
//                   onClicked: () => selectedItem(context, 0)),
//               SizedBox(height: 10),
//               listItem(
//                   text: "Movies",
//                   icon: Icons.movie,
//                   onClicked: () => selectedItem(context, 1)),
//               SizedBox(height: 460),
//               Divider(color: Colors.white),
//               listItem(
//                   text: "Log Out",
//                   icon: Icons.logout,
//                   onClicked: () => selectedItem(context, 0)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void selectedItem(BuildContext context, int index) {
//   switch (index) {
//     case 0:
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (btx) => MyHome(screenIndex: 0)));

//       break;
//     case 1:
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (btx) => MoviesScreen()));
//       break;
//   }
// }

// Widget listItem({
//   String text,
//   IconData icon,
//   VoidCallback onClicked,
// }) {
//   return ListTile(
//     leading: Icon(
//       icon,
//       color: Colors.white,
//     ),
//     title: Text(
//       text,
//       style: TextStyle(
//         color: Colors.white,
//       ),
//     ),
//     onTap: onClicked,
//   );
// }
