import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/movie_model.dart';
import 'package:netfix_moviedb/repositories/data_repository.dart';
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
        leading: Image.asset('assets/images/netflix_logo_2.png'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 500.0,
            child: dataprovider.popularMovieList.isEmpty
              ? const Center()
              : MovieCard(movie: dataprovider.popularMovieList.first),
          ),
          MovieCategory(
            label: 'Tendances actuelles',
            movieList: dataprovider.popularMovieList,
            imageHeight: 160.0,
            imageWidth: 110.0
          ),
          const MovieCategory(
            label: 'Actuellement au cinema',
            movieList: [],
            imageHeight: 320.0,
            imageWidth: 220.0
          ),
          const MovieCategory(
            label: 'Bientôt disponible',
            movieList: [],
            imageHeight: 160,
            imageWidth: 110.0
          ),
        ],
      ),
    );
  }
}