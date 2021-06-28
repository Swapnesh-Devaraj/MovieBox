// import 'package:flutter/material.dart';
// import 'package:movies_flutter/Screens/Movies.dart';
// import 'package:movies_flutter/main.dart';

// class BottomBarNavigation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Column(children: [
//           IconButton(
//             onPressed: () => selectedTab(context, 0),
//             icon: Icon(
//               Icons.home,
//               color: Colors.white,
//             ),
//           ),
//           Text(
//             "HOME",
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           )
//         ]),
//         Column(children: [
//           IconButton(
//             onPressed: () {
//               selectedTab(context, 1);
//             },
//             icon: Icon(
//               Icons.movie,
//               color: Colors.white,
//             ),
//           ),
//           Text(
//             "MOVIES",
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           )
//         ]),
//       ],
//     );
//   }
// }

// void selectedTab(BuildContext context, int index) {
//   switch (index) {
//     case 0:
//       Navigator.of(context).push(MaterialPageRoute(builder: (btx) => MyHome()));
//       break;
//     case 1:
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (btx) => MoviesScreen()));
//       break;
//   }
// }
