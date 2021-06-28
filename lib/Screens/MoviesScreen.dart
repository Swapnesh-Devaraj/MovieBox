// import '../widgets/bottomBarNavigation.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movies_flutter/Screens/movieDetailScreen.dart';
import 'package:movies_flutter/widgets/sidenavDy.dart';
import '../model/moviesModel.dart';

import 'package:http/http.dart' as http;

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  Future<MoviesModel> getData() async {
    Uri url = Uri.parse(
        "http://api.themoviedb.org/3/discover/movie?api_key=7d03c3908d3baeef699a519a75fac258");
    http.Response response = await http.get(url);

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    // Result result = Result.fromJson(jsonData["results"]);
    MoviesModel movies = MoviesModel.fromJson(jsonData);

    return movies;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text("MOVIES  "),
      ),
      body: FutureBuilder<MoviesModel>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.results.length,
                itemBuilder: (context, index) {
                  final mov = snapshot.data.results[index];
                  return MoviesView(mov: mov);
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class MoviesView extends StatelessWidget {
  const MoviesView({
    Key key,
    @required this.mov,
  }) : super(key: key);

  final Result mov;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (btx) => MovieDetailScreen(
                        movie: mov,
                      ))),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Container(
                    // margin: EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: (mov.posterPath == null)
                              ? AssetImage('assets/images/noPoster.png')
                              : NetworkImage(
                                  "http://image.tmdb.org/t/p/w500/${mov.posterPath}")),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${mov.title}:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 4),
                    Text(
                      mov.overview,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          height: 15,
          indent: 30,
          endIndent: 30,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
