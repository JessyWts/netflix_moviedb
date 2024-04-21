import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netfix_moviedb/models/movie_model.dart';
import 'package:netfix_moviedb/repositories/data_repository.dart';
import 'package:netfix_moviedb/ui/widgets/action_button.dart';
import 'package:netfix_moviedb/ui/widgets/movie_infos.dart';
import 'package:netfix_moviedb/ui/widgets/my_video_player.dart';
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
              SizedBox(
                height: 220.0,
                width: MediaQuery.of(context).size.width,
                child: newMovie!.videos!.isEmpty
                  ? const Center(
                    child: ReusableText(text: 'Aucune vidéos', color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                  )
                  : MyVideoPlayer(video: newMovie!.videos!.first),
              ),
              MovieInfos(movie: newMovie!),
              const SizedBox(height: 10.0,),
              ActionButton(
                label: 'Lecture', icon: Icons.play_arrow, bgColor: Colors.white, color: kBackgroundColor,
              ),
              const SizedBox(height: 10.0),
              ActionButton(
                label: 'Télécharger', icon: Icons.download, bgColor:Colors.grey.withOpacity(0.3), color: Colors.white,
              ),
              const SizedBox(height: 20.0,),
              ReusableText(
                text: newMovie!.overview,
                color: Colors.white,
                fontSize: 16, 
                fontWeight: FontWeight.w400
              ),
              const SizedBox(height: 20.0,),
            ]
          ),
        ),
    );
  }
}