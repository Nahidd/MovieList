import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_list_app4/db/temp_db.dart';
import 'package:movie_list_app4/details_page.dart';
import 'package:movie_list_app4/new_movie_page.dart';

import 'models/models.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewMoviePage())),
          )
        ],
      ),
      body: GridView.count(
      crossAxisCount: 2,
        childAspectRatio: 0.7,
        children: movieList.map((movie) => MovieItem(movie: movie)).toList(),
    ));
  }
}

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Hero(
              tag: movie.id!,
              child: Image.asset(
                movie.image!,
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 5,
            child: ElevatedButton(
                onPressed: () =>
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            MovieDetails(movie))),
                child: Text('Details')
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24,), topRight: Radius.circular(24))
              ),
              alignment: Alignment.center,

              padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(movie.name!, style: TextStyle(color: Colors.white, fontSize: 18),),
                    Text(movie.subTitle!, style: TextStyle(color: Colors.white),),
                  ],
                )
            ),
          ),
          Positioned(
            bottom: 5,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 30,),
                  Text('${movie.rating}', style: TextStyle(color: Colors.white, fontSize: 20),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

