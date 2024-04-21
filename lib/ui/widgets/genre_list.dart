import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/genre_model.dart';
import 'package:netfix_moviedb/ui/screens/genres_screen.dart';
import 'package:netfix_moviedb/ui/widgets/reusable_text.dart';

class GenreList extends StatelessWidget {
  const GenreList({
    super.key,
    required this.genresMovieList, required this.genresTVList,
  });

  final List <GenreModel> genresMovieList;
  final List <GenreModel> genresTVList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15.0,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        ReusableText(text: 'Genres', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ],
        ),
        const SizedBox(height: 5.0,),
        SizedBox(
          height: 80,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GenresScreen(genres: genresTVList, isMovie: false))),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: const Center(
                      child: ReusableText(
                        text: 'TV List', 
                        color: Colors.white, 
                        fontSize: 16, 
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GenresScreen(genres: genresMovieList, isMovie: true))),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: const Center(
                      child: ReusableText(
                        text: 'Movie List', 
                        color: Colors.white, 
                        fontSize: 16, 
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}