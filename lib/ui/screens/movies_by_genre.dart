import 'package:flutter/material.dart';

import 'package:netfix_moviedb/models/genre_model.dart';
import 'package:netfix_moviedb/ui/widgets/reusable_text.dart';
import 'package:netfix_moviedb/utils/constants.dart';

class MoviesByGenre extends StatelessWidget {
  final GenreModel genre;
  const MoviesByGenre({ super.key, required this.genre });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
         iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: ReusableText(
          text: 'Category ${genre.name}', 
          color: Colors.white, 
          fontSize: 15, 
          fontWeight: FontWeight.w600
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: const [
          
        ],
      ),
    );
  }
}