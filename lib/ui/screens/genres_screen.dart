import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/genre_model.dart';
import 'package:netfix_moviedb/ui/screens/movies_by_genre.dart';
import 'package:netfix_moviedb/ui/widgets/reusable_text.dart';
import 'package:netfix_moviedb/utils/constants.dart';

class GenresScreen extends StatelessWidget {
  final List<GenreModel> genres;
  final bool isMovie;

  const GenresScreen({ super.key, required this.genres, required this.isMovie });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        backgroundColor: kBackgroundColor,
        title: isMovie
          ? const ReusableText(text: "Genres for Movies", color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)
          : const ReusableText(text: "Genres for TV shows", color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      backgroundColor: kBackgroundColor,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          mainAxisExtent: 150
        ),
        // padding: const EdgeInsets.all(8.0),
        itemCount: genres.length,   
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesByGenre(genre: genres[index]),)),
            child: Container(
              color: Colors.pink.withOpacity(0.5),
              child: Center(
                child: ReusableText(
                  text: genres[index].name, 
                  color: Colors.white, 
                  fontSize: 15, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}