import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/models.dart';
import 'package:netfix_moviedb/ui/screens/movies_by_genre_screen.dart';
import 'package:netfix_moviedb/ui/widgets/reusable_text.dart';
import 'package:netfix_moviedb/utils/constants.dart';

class MovieInfos extends StatelessWidget {
  final MovieModel movie;
  const MovieInfos({ super.key, required this.movie });

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
          text: movie.title,
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        const SizedBox(height: 5.0,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            height: 25,
            child: ListView.builder(
              itemCount: movie.genres!.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                GenreModel genre = movie.genres![index];
                return Padding(
                  padding: const EdgeInsets.only(right:8.0,),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesByGenreScreen(genre: genre)));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: ReusableText(
                        text: genre.name,
                        color: kBackgroundColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 5.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ReusableText(
                text: movie.formatReleaseDate(),
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(width: 5.0,),
            ReusableText(
              text: 'Recommandé à ${(movie.voteAverage * 10).toInt()}%',
              color: Colors.green,
              fontSize: 13,
              fontWeight: FontWeight.w500
            ),
          ],
        )
      ],
    );
  }
}