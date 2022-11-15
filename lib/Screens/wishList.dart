import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/Screens/movieDetailScreen.dart';
import 'package:movies_flutter/model/moviesModel.dart';
import 'package:movies_flutter/widgets/toast.dart';

class WishList extends StatelessWidget {
  Stream<List<Result>> getWishList() {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("wishlisted")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Result.fromJson(doc.data())).toList());
  }

  Future removeFromWishlist(Result mov) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("wishlisted")
        .doc(mov.id.toString())
        .delete();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 40,
          backgroundColor: Colors.blue[900],
          title: Text("Wishlist"),
        ),
        body: StreamBuilder(
          stream: getWishList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData || snapshot.data.isEmpty) {
              return Center(
                child: Text("No Wishlisted Movies"),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final mov = snapshot.data[index];
                return Stack(
                  children: [
                    Positioned(
                        right: 35,
                        top: 10,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          iconSize: 32,
                          icon: Icon(Icons.bookmark_remove, color: Colors.red),
                          onPressed: () {
                            removeFromWishlist(mov).then((value) =>
                                showToast("Removed from Wishlist", context));
                          },
                        )),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 25),
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
                                        image: (mov.posterPath == null)
                                            ? AssetImage(
                                                'assets/images/noPoster.png')
                                            : NetworkImage(
                                                "http://image.tmdb.org/t/p/w500/${mov.posterPath}")),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                  child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (btx) => MovieDetailScreen(
                                              movie: mov,
                                            ))),
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
                                ),
                              ))
                            ],
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
                  ],
                );
              },
            );
          },
        ));
  }
}
