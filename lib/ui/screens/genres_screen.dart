import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/genre_model.dart';
import 'package:netfix_moviedb/ui/screens/movies_by_genre_screen.dart';
import 'package:netfix_moviedb/ui/widgets/widgets.dart';
import 'package:netfix_moviedb/utils/constants.dart';

class GenresScreen extends StatelessWidget {
  final List<GenreModel> genres;
  final bool isMovie;

  const GenresScreen({ super.key, required this.genres, required this.isMovie });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(
            title: isMovie
              ? const ReusableText(text: "Genres for Movies", color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)
              : const ReusableText(text: "Genres for TV shows", color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          )
        ],
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
            padding: const EdgeInsets.only(top: 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              mainAxisExtent: 150
            ),
            itemCount: genres.length,   
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesByGenreScreen(genre: genres[index]),)),
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
        ),
      ),
    );
  }
}