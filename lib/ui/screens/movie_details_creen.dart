import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfix_moviedb/models/movie_model.dart';
import 'package:netfix_moviedb/repositories/data_repository.dart';
import 'package:netfix_moviedb/ui/widgets/movie_infos.dart';
import 'package:netfix_moviedb/ui/widgets/reusable_text.dart';
import 'package:netfix_moviedb/utils/constants.dart';
import 'package:provider/provider.dart';

class MovieDetailsCreen extends StatefulWidget {
  final MovieModel movie;
  const MovieDetailsCreen({ super.key, required this.movie });

  @override
  State <MovieDetailsCreen> createState() => _MovieDetailsCreenState();
}

class _MovieDetailsCreenState extends State<MovieDetailsCreen> {
  MovieModel? newMovie;

  @override
  void initState() {
    super.initState();
    getMovieDetails();
  }

  Future<void> getMovieDetails () async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);

    MovieModel movie = await dataProvider.getMoviesDetails(movie: widget.movie);
    setState(() {
      newMovie = movie;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        backgroundColor: kBackgroundColor,
      ),
      body: newMovie == null
        ? Center(
            child: SpinKitFadingCircle(
              color: kPrimaryColor,
              size: 20.0,
            )
          )
        : Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,
              ),
              MovieInfos(movie: newMovie!),
              const SizedBox(height: 10.0,),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow,
                      color: kBackgroundColor,
                    ),
                    const SizedBox(width: 5.0,),
                    ReusableText(text: 'Lecture', color: kBackgroundColor, fontSize: 16.0, fontWeight: FontWeight.w600),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.download,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.0,),
                    ReusableText(text: 'Télécharger', color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
                  ],
                ),
              ),
            ]
          ),
        ),
    );
  }
}