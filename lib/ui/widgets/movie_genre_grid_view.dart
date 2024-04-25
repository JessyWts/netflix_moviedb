import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/models.dart';
import 'package:netfix_moviedb/ui/screens/movie_details_creen.dart';

class MovieGenreGridView extends StatelessWidget {
  const MovieGenreGridView({
    super.key,
    required this.movieList,
    required this.genre,
    required this.callback,
  });


  final List<MovieModel> movieList;
  final GenreModel genre;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        final currentPosition = notification.metrics.pixels;
        final maxPosition = notification.metrics.maxScrollExtent;

        if (currentPosition >= maxPosition) {
          callback();
        }
        return true;
      },
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          mainAxisExtent: 350
        ),
        scrollDirection: Axis.vertical,
        itemCount: movieList.length,   
        itemBuilder: (context, index) {
          MovieModel movie = movieList[index];
      
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsCreen(movie: movie,),)),
            child: CachedNetworkImage(
              imageUrl: movie.posterURL(),
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.error),
              ),
            ),
          );
        },
      ),
    );
  }
}
