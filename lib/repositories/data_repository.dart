import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/genre_model.dart';
import 'package:netfix_moviedb/models/movie_model.dart';
import 'package:netfix_moviedb/services/api_service.dart';

class DataRepository with ChangeNotifier {
  final APIService apiService = APIService();

  final List<MovieModel> _popularMovieList = [];
  int _popularMoviePageIndex = 1;

  final List<MovieModel> _nowPlayingMovieList = [];
  int _nowPlayingMoviePageIndex = 1;

  final List<MovieModel> _upcomingMovieList = [];
  int _upcominMoviePageIndex = 1;

  List<GenreModel> genresMovieList = [];
  List<GenreModel> genresTvList = [];

  List<MovieModel> get popularMovieList => _popularMovieList;
  List<MovieModel> get nowPlayingMovieList => _nowPlayingMovieList;
  List<MovieModel> get upcomingMovieList => _upcomingMovieList;

  Future<void> getPopularMovies() async {
    try {
      List<MovieModel> movies = await apiService.getPopularMovies(pageNumber: _popularMoviePageIndex);
      _popularMovieList.addAll(movies);
      _popularMoviePageIndex++;
      notifyListeners();
    } on Response catch (response) {
      debugPrint("Error: ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getNowPlayingMovies() async {
    try {
      List<MovieModel> movies = await apiService.getNowPlayingMovies(pageNumber: _nowPlayingMoviePageIndex);
      _nowPlayingMovieList.addAll(movies);
      _nowPlayingMoviePageIndex++;
      notifyListeners();
    } on Response catch (response) {
      debugPrint("Error: ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getUpcomingMovies() async {
    try {
      List<MovieModel> movies = await apiService.geUpcomingMovies(pageNumber: _upcominMoviePageIndex);
      _upcomingMovieList.addAll(movies);
      _upcominMoviePageIndex++;
      notifyListeners();
    } on Response catch (response) {
      debugPrint("Error: ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getMoviesGenres() async {
    try {
      genresMovieList = await apiService.getMoviesGenres();
      // notifyListeners();
      // List<GenreModel> genresList = await apiService.getMoviesGenres();
      // return genresList;
    } on Response catch (response) {
      debugPrint("Error: ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getTvGenres() async {
    try {
      genresTvList = await apiService.getTvGenres();
      // notifyListeners();
      // List<GenreModel> genresList = await apiService.getMoviesGenres();
      // return genresList;
    } on Response catch (response) {
      debugPrint("Error: ${response.statusCode}");
      rethrow;
    }
  }

  Future<MovieModel> getMoviesDetails({required MovieModel movie }) async {
    try {
       MovieModel movieDetails = await apiService.getMoviesDetails(movie: movie);
       // Get videos for the movie 
       movieDetails = await apiService.getMoviesVideos(movie: movieDetails);
      return movieDetails;
    } on Response catch (response) {
      debugPrint("Error: ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> initData() async {
    await Future.wait([
      getTvGenres(),
      getMoviesGenres(),
      getPopularMovies(),
      getNowPlayingMovies(),
      getUpcomingMovies()
    ]);
  }
}