import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/movie_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  const MovieCard({ super.key, required this.movie });

  @override
  Widget build(BuildContext context){
    return CachedNetworkImage(
      imageUrl: movie.posterURL(),
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.error),
      ),
    );
  }
}