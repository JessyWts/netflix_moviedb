import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/movie_model.dart';
import 'package:netfix_moviedb/ui/widgets/reusable_text.dart';

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
        ReusableText(
          text: 'Genres : ${movie.formatGenres()}',
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500
        ),
        const SizedBox(height: 5.0,),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ReusableText(
                text: movie.releaseDate.toString().substring(0, 4),
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(width: 5.0,),
            ReusableText(
              text: 'Recommander à ${(movie.voteCount * 10).toInt()}%',
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
          ],
        )
      ],
    );
  }
}