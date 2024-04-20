import 'package:dio/dio.dart';
import 'package:netfix_moviedb/models/movie_model.dart';
import 'package:netfix_moviedb/services/api.dart';

class APIService {
  final API api = API();
  final Dio dio = Dio();

  Future<Response> getData(String path, {Map<String,dynamic>? params}) async {
    String url = api.baseURL + path;

    Map<String, dynamic> query = {
      'api_key': api.apiKey,
      'language': 'fr-FR',
    };

    if (params != null) {
      query.addAll(params);
    }

    final response = await dio.get(url, queryParameters: query);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  Future<List<MovieModel>> getPopularMovies({required int pageNumber}) async {
    Response response = await getData('/movie/popular', params: {
      'page': pageNumber
    });

    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> results = data["results"];
      List<MovieModel> movies = [];

      for (Map<String, dynamic> json in results) {
        MovieModel movie = MovieModel.fromJson(json);
        movies.add(movie);
      }

      return movies;
    } else {
      throw response;
    }
  }
}