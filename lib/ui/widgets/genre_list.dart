import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfix_moviedb/models/genre_model.dart';
import 'package:netfix_moviedb/ui/widgets/reusable_text.dart';

class GenreList extends StatelessWidget {
  const GenreList({
    super.key,
    required this.genresList,
  });

  final List <GenreModel> genresList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15.0,),
        const ReusableText(text: 'Genres', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        const SizedBox(height: 5.0,),
        SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: genresList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              GenreModel genre = genresList[index];
              return GestureDetector(
                onTap: () {
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.pink.withOpacity(0.5),
                  width: 120,
                  margin: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    genre.name,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize:15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}