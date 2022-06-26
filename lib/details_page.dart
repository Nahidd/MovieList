import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_list_app4/db/temp_db.dart';
import 'package:movie_list_app4/models/models.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  MovieDetails(this.movie);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //pinned: true,
            floating: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.movie.name!),
              background: Hero(
                tag: widget.movie.id!,
                child: Image.asset(
                  widget.movie.image!,
                  width: double.maxFinite,
                  height: 300, fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: Text(widget.movie.name!),
                subtitle: Text(widget.movie.subTitle!),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star),
                    Text('${widget.movie.rating}')
                  ],
                ),
                tileColor: Colors.grey.shade300,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(details),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
