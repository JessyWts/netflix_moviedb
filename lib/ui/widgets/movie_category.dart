import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfix_moviedb/models/movie_model.dart';
import 'package:netfix_moviedb/ui/widgets/movie_card.dart';

class MovieCategory extends StatelessWidget {
  final String label;
  final List<MovieModel> movieList;
  final double imageHeight;
  final double imageWidth;
  final Function callback;
  
  const MovieCategory({ super.key, required this.label, required this.movieList, required this.imageHeight, required this.imageWidth, required this.callback });

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15.0,),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize:18,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 5.0,),
          SizedBox(
            height: imageHeight,
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                final currentPosition = notification.metrics.pixels;
                final maxPosition = notification.metrics.maxScrollExtent;

                if (currentPosition >= maxPosition / 2) {
                  callback();
                }
                return true;
              },
              child: ListView.builder(
                itemCount: movieList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: imageWidth,
                    margin: const EdgeInsets.only(right: 8.0),
                    child: movieList.isEmpty
                      ? Center(
                        child: Text(index.toString()),
                      )
                      : MovieCard(movie: movieList[index]),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}