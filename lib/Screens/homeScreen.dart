import 'package:flutter/material.dart';
import '../widgets/IconList.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text("HOME  "),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/Vancouver.jpeg"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Vancouver",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  subtitle: Text("British Columbia, Canada."),
                  trailing: IconButton(
                    icon: isFav
                        ? Icon(
                            Icons.star_rate,
                            color: Colors.amberAccent,
                            size: 35,
                          )
                        : Icon(
                            Icons.star_rate_outlined,
                            size: 35,
                          ),
                    onPressed: () => setState(() => isFav = !isFav),
                  ),
                ),
                SizedBox(height: 20),
                IconsList(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Vancouver, a bustling west coast seaport in British Columbia, is among Canada’s densest,"
                      "most ethnically diverse cities. A popular filming location,"
                      "it’s surrounded by mountains, and also has thriving art, theatre and music scenes."
                      "Vancouver Art Gallery is known for its works by regional artists,"
                      "while the Museum of Anthropology houses preeminent First Nations collections."),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
