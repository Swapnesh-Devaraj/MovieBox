import 'dart:ui';
import 'package:flutter/material.dart';
import '/model/moviesModel.dart';

Widget generateBluredImage(Result movie) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: (movie.posterPath == null)
            ? NetworkImage(
                'https://www.cinemahalls.com/wp-content/uploads/2019/10/Picture-Not-Available.jpg')
            : NetworkImage(
                "http://image.tmdb.org/t/p/w500/${movie.backdropPath}"),
        fit: BoxFit.cover,
      ),
    ),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
      ),
    ),
  );
}
