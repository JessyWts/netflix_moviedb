import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/movie_model.dart';
import 'package:netfix_moviedb/services/api_service.dart';

class DataRepository with ChangeNotifier {
  final APIService apiService = APIService();
  final List<MovieModel> _popularMovieList = [];
  int _popularMoviePageIndex = 1;

  List<MovieModel> get popularMovieList => _popularMovieList;

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
}