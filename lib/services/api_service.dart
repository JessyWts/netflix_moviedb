import 'package:dio/dio.dart';
import 'package:netfix_moviedb/models/models.dart';
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

  Future<List<MovieModel>> getMoviesFromResponse(String endpoint, {required int pageNumber}) async {
    Response response = await getData(endpoint, params: {'page': pageNumber});

    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> results = data["results"];
      List<MovieModel> movies = results.map<MovieModel>((dynamic movieJson) {
        return MovieModel.fromJson(movieJson);
      }).toList();

      return movies;
    } else {
      throw response;
    }
  }

  Future<List<MovieModel>> getPopularMovies({required int pageNumber}) async {
    return getMoviesFromResponse('/movie/popular', pageNumber: pageNumber);
  }

  Future<List<MovieModel>> getNowPlayingMovies({required int pageNumber}) async {
    return getMoviesFromResponse('/movie/now_playing', pageNumber: pageNumber);
  }

  Future<List<MovieModel>> geUpcomingMovies({required int pageNumber}) async {
    return getMoviesFromResponse('/movie/upcoming', pageNumber: pageNumber);
  }

  Future<List<GenreModel>> getGenresFromResponse(String endpoint) async {
    Response response = await getData(endpoint);

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

  Future<List<GenreModel>> getMoviesGenres() async {
    return getGenresFromResponse('/genre/movie/list');
  }

  Future<List<GenreModel>> getTvGenres() async {
    return getGenresFromResponse('/genre/tv/list');
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

  Future<MovieModel> getMoviesCredits({required MovieModel movie }) async {
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

  /// using api fonctionality
  /// Combine querie at once
  Future<MovieModel> getMovie({required MovieModel movie }) async {
    final Response response = await getData('/movie/${movie.id}',
      params: {
        'include_image_language': "null",
        'append_to_response': 'videos,images,credits',
      }
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.data;

      final List<Future<dynamic>> futures = [
        Future.delayed(const Duration(milliseconds: 200), () => MovieModel.fromJson(data)),
        Future.delayed(const Duration(milliseconds: 200), () => _getCastAndCrew(data)),
        Future.delayed(const Duration(milliseconds: 200), () => _getVideos(data)),
        Future.delayed(const Duration(milliseconds: 200), () => _getImages(data)),
      ];

      final results = await Future.wait(futures);

      final movieDetails = results[0] as MovieModel;
      final castAndCrew = results[1] as List<PersonModel>;
      final videos = results[2] as List<VideoModel>; 
      final images = results[3] as ImageModel;

      return movieDetails.copyWith(
        cast: castAndCrew.where((person) => person.castId != null || person.character != null ).toList(),
        crew: castAndCrew.where((person) => person.job != null || person.department != null ).toList(),
        videos: videos,
        images: images
      );
    } else {
      throw response;
    }
  }

  Future<List<PersonModel>> _getCastAndCrew(Map<String, dynamic> data) async {
  final List<PersonModel> cast = data["credits"]["cast"].map<PersonModel>((dynamic castJson) {
    return PersonModel.fromJson(castJson);
  }).toList();

  final List<PersonModel> crew = data["credits"]["crew"].map<PersonModel>((dynamic crewJson) {
    return PersonModel.fromJson(crewJson);
  }).toList();

  return [...cast, ...crew];
}

Future<List<VideoModel>> _getVideos(Map<String, dynamic> data) async {
  final List<VideoModel> videos = data["videos"]["results"].map<VideoModel>((dynamic videoJson) {
    return VideoModel.fromJson(videoJson);
  }).toList();

  return videos;
}

Future<ImageModel> _getImages(Map<String, dynamic> data) async {
  final ImageModel images = ImageModel.fromJson(data["images"]);
  return images;
}

  /// https://developer.themoviedb.org/reference/discover-movie
  /// take multi parameters
  Future<List<MovieModel>> getDiscoverMovies({required GenreModel genre, required int pageNumber}) async {
    Response response = await getData('/discover/movie', params: {
      'page': pageNumber,
      'include_adult': false,
      'include_video': false,
      'sort_by': 'popularity.desc',
      'with_genres': genre.id
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
}