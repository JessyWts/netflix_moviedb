import 'package:flutter/material.dart';
import 'package:netfix_moviedb/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netfix_moviedb/models/movie_model.dart';
import 'package:netfix_moviedb/repositories/data_repository.dart';
import 'package:netfix_moviedb/utils/constants.dart';

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
            shrinkWrap: true,
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
              const ReusableText(
                text: 'Actors',
                color: Colors.white,
                fontSize: 16, 
                fontWeight: FontWeight.bold
              ),
              const SizedBox(height: 10.0,),
              SizedBox(
                height: 360,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: newMovie!.cast?.length,
                  itemBuilder: (context, index) {
                    return newMovie!.cast?[index].profilePath == null
                      ? const Center()
                      : CastingCard(person: newMovie!.cast?[index]);
                  },
                ),
              ),
              const SizedBox(height: 20.0,),
              const ReusableText(
                text: 'Production Team',
                color: Colors.white,
                fontSize: 16, 
                fontWeight: FontWeight.bold
              ),
              const SizedBox(height: 10.0,),
              SizedBox(
                height: 360,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: newMovie!.crew?.length,
                  itemBuilder: (context, index) {
                    return newMovie!.crew?[index].profilePath == null
                      ? const Center()
                      : CastingCard(person: newMovie!.crew?[index]);
                  },
                ),
              ),
              const SizedBox(height: 20.0,),
              const ReusableText(
                text: 'Images',
                color: Colors.white,
                fontSize: 16, 
                fontWeight: FontWeight.bold
              ),
              const SizedBox(height: 10.0,),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: newMovie!.images?.backdrops?.length,
                  itemBuilder: (context, index) {
                    return newMovie!.images?.backdrops == null
                      ? const Center()
                      : GaleryCard(image: newMovie!.images?.backdrops?[index]);
                  },
                ),
              ),
            ]
          ),
        ),
    );
  }
}