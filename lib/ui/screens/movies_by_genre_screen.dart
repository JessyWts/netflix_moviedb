import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netfix_moviedb/models/models.dart';
import 'package:netfix_moviedb/repositories/data_repository.dart';
import 'package:netfix_moviedb/ui/widgets/widgets.dart';
import 'package:netfix_moviedb/utils/constants.dart';
import 'package:provider/provider.dart';

class MoviesByGenreScreen extends StatefulWidget {
  final GenreModel genre;
  const MoviesByGenreScreen({super.key, required this.genre});

  @override
  State<MoviesByGenreScreen> createState() => _MoviesByGenreScreenState();
}

class _MoviesByGenreScreenState extends State<MoviesByGenreScreen> {
  List<MovieModel>? movies;
  int pageIndex = 1;

  @override
  void initState() {
    super.initState();
    getMoviesByGenre();
  }

  Future<void> getMoviesByGenre () async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);

    List<MovieModel> moviesList = await dataProvider.getMoviesByGenreFirst(genre: widget.genre, pageNumber: pageIndex);
    dataProvider.movieListByGenreList.clear();
    setState(() {
      movies = moviesList;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final dataprovider = Provider.of<DataRepository>(context);
    
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: movies == null
      ? Center(
        child: SpinKitFadingCircle(
          color: kPrimaryColor,
          size: 20.0,
        )
      )
      : NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(
            title: ReusableText(
              text: 'Category ${widget.genre.name}',
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600
            ),
          )
        ],
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: MovieGenreGridView(
            movieList: movies!,
            genre: widget.genre,
            callback: () {
              setState(() {
                pageIndex++;
                dataprovider.getMoviesByGenre(genre: widget.genre, pageNumber: pageIndex);
                movies!.addAll(dataprovider.movieListByGenreList);
              });
            }
          ),
        ),
      ),
    );
  }
}
