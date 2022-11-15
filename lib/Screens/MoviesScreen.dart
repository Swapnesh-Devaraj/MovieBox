import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/Screens/movieDetailScreen.dart';
import 'package:movies_flutter/auth/auth.dart';
import '../model/moviesModel.dart';
import 'package:http/http.dart' as http;

import '../widgets/toast.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  Future<List<Result>> moviesData;
  StreamController moviesController;

  @override
  void initState() {
    moviesController = StreamController();
    getData();
    super.initState();
  }

  getData() async {
    try {
      Uri url = Uri.parse(
          "http://api.themoviedb.org/3/discover/movie?api_key=7d03c3908d3baeef699a519a75fac258");
      http.Response response = await http.get(url);

      Map<String, dynamic> jsonData = jsonDecode(response.body);

      // Result result = Result.fromJson(jsonData["results"]);
      MoviesModel movies = MoviesModel.fromJson(jsonData);
      moviesController.sink.add(movies.results);
      // moviesData = Future.value(movies.results);
    } catch (e) {
      // moviesData = Future.error(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    moviesController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 40,
        backgroundColor: Colors.blue[900],
        title: Text("MOVIES"),
      ),
      body: StreamBuilder(
          stream: moviesController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final mov = snapshot.data[index];
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

class MoviesView extends StatefulWidget {
  const MoviesView({
    Key key,
    @required this.mov,
  }) : super(key: key);

  final Result mov;

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  bool isWishlisted = false;

  @override
  void initState() {
    super.initState();
    wishlist();
  }

  Future addToWishlist(Result mov) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("wishlisted")
        .doc(mov.id.toString())
        .set(mov.toJson());
  }

  Future removeFromWishlist(Result mov) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("wishlisted")
        .doc(mov.id.toString())
        .delete();
  }

  void wishlist() async {
    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("wishlisted")
        .doc(widget.mov.id.toString())
        .get();
    if (mounted)
      setState(() {
        isWishlisted = data.exists;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (btx) => MovieDetailScreen(
                              movie: widget.mov,
                            ))),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: (widget.mov.posterPath == null)
                                  ? AssetImage('assets/images/noPoster.png')
                                  : NetworkImage(
                                      "http://image.tmdb.org/t/p/w500/${widget.mov.posterPath}")),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("${widget.mov.title}:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 4),
                        Text(
                          widget.mov.overview,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    )),
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
        ),
        Positioned(
            right: 35,
            top: 10,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              iconSize: 32,
              icon: isWishlisted
                  ? Icon(Icons.bookmark, color: Colors.blue[900])
                  : Icon(Icons.bookmark_border_outlined),
              onPressed: () {
                setState(() {
                  isWishlisted = !isWishlisted;
                });
                isWishlisted
                    ? addToWishlist(widget.mov).then(
                        (value) => showToast("Added to Wishlist", context))
                    : removeFromWishlist(widget.mov).then(
                        (value) => showToast("Removed from Wishlist", context));
              },
            )),
      ],
    );
  }
}
