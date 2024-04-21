import 'package:dio/dio.dart';
import 'package:netfix_moviedb/models/genre_model.dart';
import 'package:netfix_moviedb/models/movie_model.dart';
import 'package:netfix_moviedb/models/person_model.dart';
import 'package:netfix_moviedb/models/video_model.dart';
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

  Future<List<MovieModel>> getNowPlayingMovies({required int pageNumber}) async {
    Response response = await getData('/movie/now_playing', params: {
      'page': pageNumber
    });

    if (response.statusCode == 200) {
      Map data = response.data;
      
      List<MovieModel> movies = data["results"].map<MovieModel>((dynamic movieJson){
       return MovieModel.fromJson(movieJson);
      }).toList();

      return movies;
    } else {
      throw response;
    }
  }

  Future<List<MovieModel>> geUpcomingMovies({required int pageNumber}) async {
    Response response = await getData('/movie/upcoming', params: {
      'page': pageNumber
    });

    if (response.statusCode == 200) {
      Map data = response.data;
      
      List<MovieModel> movies = data["results"].map<MovieModel>((dynamic movieJson){
       return MovieModel.fromJson(movieJson);
      }).toList();

      return movies;
    } else {
      throw response;
    }
  }

  Future<List<GenreModel>> getMoviesGenres() async {
    Response response = await getData('/genre/movie/list');

    if (response.statusCode == 200) {
      Map data = response.data;
      
      List<GenreModel> genres = data["genres"].map<GenreModel>((dynamic movieJson){
       return GenreModel.fromJson(movieJson);
      }).toList();

      return genres;
    } else {
      throw response;
    }
  }

  Future<List<GenreModel>> getTvGenres() async {
    Response response = await getData('/genre/tv/list');

    if (response.statusCode == 200) {
      Map data = response.data;
      
      List<GenreModel> genres = data["genres"].map<GenreModel>((dynamic movieJson){
       return GenreModel.fromJson(movieJson);
      }).toList();

      return genres;
    } else {
      throw response;
    }
  }

  Future<MovieModel> getMoviesDetails({required MovieModel movie }) async {
    Response response = await getData('/movie/${movie.id}');

    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      
      MovieModel movie = MovieModel.fromJson(data);

      return movie;
    } else {
      throw response;
    }
  }

  Future<MovieModel> getMoviesVideos({required MovieModel movie }) async {
    Response response = await getData('/movie/${movie.id}/videos');

    if (response.statusCode == 200) {
      Map data = response.data;
      List<VideoModel> videos = [];
      videos = data["results"].map<VideoModel>((dynamic videoJson) {
        return VideoModel.fromJson(videoJson);
      }).toList();
      
      return movie.copyWith(videos: videos);
    } else {
      throw response;
    }
  }

  Future<MovieModel> getMoviescredits({required MovieModel movie }) async {
    Response response = await getData('/movie/${movie.id}/credits');

    if (response.statusCode == 200) {
      Map data = response.data;
      List<PersonModel> cast = [];
      List<PersonModel> crew = [];

      cast = data["cast"].map<PersonModel>((dynamic castJson) {
        return PersonModel.fromJson(castJson);
      }).toList();

      crew = data["crew"].map<PersonModel>((dynamic crewJson) {
        return PersonModel.fromJson(crewJson);
      }).toList();
      
      return movie.copyWith(cast: cast, crew: crew);
    } else {
      throw response;
    }
  }
}