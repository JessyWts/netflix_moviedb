import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/movie_model.dart';
import 'package:netfix_moviedb/repositories/data_repository.dart';
import 'package:netfix_moviedb/ui/widgets/genre_list.dart';
import 'package:netfix_moviedb/ui/widgets/movie_card.dart';
import 'package:netfix_moviedb/ui/widgets/movie_category.dart';
import 'package:netfix_moviedb/utils/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ super.key });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel>? movies;

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final dataprovider = Provider.of<DataRepository>(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
         iconTheme: const IconThemeData(
          color: Colors.white
        ),
        leading: Image.asset('assets/images/netflix_logo_2.png'),
        actions:  [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu,)
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 500.0,
            child: dataprovider.popularMovieList.isEmpty
              ? const Center()
              : MovieCard(movie: dataprovider.popularMovieList.first),
          ),
          GenreList(genresMovieList: dataprovider.genresMovieList, genresTVList: dataprovider.genresTvList, ),
          const SizedBox(height: 15.0,),
          MovieCategory(
            label: 'Tendances actuelles',
            imageHeight: 160.0,
            imageWidth: 110.0,
            movieList: dataprovider.popularMovieList,
            callback: dataprovider.getPopularMovies,
          ),
          MovieCategory(
            label: 'Actuellement au cinema',
            imageHeight: 320.0,
            imageWidth: 220.0,
            movieList:  dataprovider.nowPlayingMovieList,
            callback: dataprovider.getNowPlayingMovies,
          ),
          MovieCategory(
            label: 'Bientôt disponible',
            imageHeight: 160,
            imageWidth: 110.0,
            movieList: dataprovider.upcomingMovieList,
            callback: dataprovider.getUpcomingMovies,
          ),
        ],
      ),
    );
  }
}