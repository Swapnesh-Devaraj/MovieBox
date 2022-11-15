import 'package:flutter/material.dart';
import '/widgets/blurImg.dart';
import '/model/moviesModel.dart';

class MovieDetailScreen extends StatefulWidget {
  final Result movie;
  MovieDetailScreen({this.movie});

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool iconChange = false;

  void changeIc() {
    setState(() {
      iconChange = !iconChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          generateBluredImage(widget.movie),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(300),
                        height: 350,
                        width: 280,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: (widget.movie.posterPath == null)
                                  ? AssetImage('assets/images/noPoster.png')
                                  : NetworkImage(
                                      "http://image.tmdb.org/t/p/w500/${widget.movie.posterPath}")),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.movie.title,
                            style: TextStyle(fontSize: 28, color: Colors.white),
                          ),
                        ),
                        Text(
                          "IMDB: ${widget.movie.voteAverage.toString()}/10",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.movie.originalLanguage.toString(),
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          (widget.movie.releaseDate == null)
                              ? "Unknown"
                              : "Year-${widget.movie.releaseDate.year.toString()}",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.movie.overview,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
