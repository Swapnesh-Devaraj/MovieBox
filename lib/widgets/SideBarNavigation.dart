import 'package:flutter/material.dart';

class SideNavigation extends StatelessWidget {
  final Function onChanged;
  SideNavigation({this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Material(
        color: Theme.of(context).primaryColor,
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
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.biography.com/.image/t_share/MTU0ODUwMjQ0NjIwNzI0MDAx/chris-hemsworth-poses-during-a-photo-call-for-thor-ragnarok-on-october-15-2017-in-sydney-australia-photo-by-mark-metcalfe_getty-images-for-disney-square.jpg")),
              accountName: Text(
                "Chris Hemsworth",
              ),
              accountEmail: Text(
                "christhethor@gamil.com",
              ),
            ),
            ListTile(
              title: Text("Home", style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.home, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                onChanged(0);
              },
            ),
            SizedBox(height: 10),
            ListTile(
                title: Text("Movies", style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.movie, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                  onChanged(1);
                }),
            SizedBox(height: 400),
            Divider(color: Colors.white),
            ListTile(
                title: Text("Log Out", style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.logout, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                  onChanged(0);
                }),
          ],
        ),
      ),
    );
  }
}
