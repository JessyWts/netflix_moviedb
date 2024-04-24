import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/models.dart';
import 'package:netfix_moviedb/ui/screens/movie_details_creen.dart';
import 'package:netfix_moviedb/ui/widgets/widgets.dart';

class MovieGenreGridView extends StatelessWidget {
  const MovieGenreGridView({
    super.key,
    required this.label,
    required this.movieList,
    required this.genre,
    required this.imageHeight,
    required this.imageWidth, 
    // required this.callback,
  });

  final String label;
  final List<MovieModel> movieList;
  final GenreModel genre;
  final double imageHeight;
  final double imageWidth;
  // final Function callback;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 0),
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
    );
  }
}
