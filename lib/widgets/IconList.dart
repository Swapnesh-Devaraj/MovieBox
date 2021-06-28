import 'package:flutter/material.dart';

class IconsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.call,
              color: Theme.of(context).accentColor,
            ),
          ),
          Text(
            "CALL",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          )
        ]),
        Column(children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.navigation,
              color: Theme.of(context).accentColor,
            ),
          ),
          Text(
            "ROUTE",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          )
        ]),
        Column(children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Theme.of(context).accentColor,
            ),
          ),
          Text(
            "SHARE",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          )
        ]),
      ],
    );
  }
}
