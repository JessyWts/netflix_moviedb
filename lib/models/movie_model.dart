import 'package:netfix_moviedb/services/api.dart';

import 'genre_model.dart';
import 'production_country_model.dart';
import 'spoken_language_model.dart';

class MovieModel {
    final bool adult;
    final String backdropPath;
    final String? belongsToCollection;
    final int? budget;
    final List<GenreModel>? genres;
    final List<int>? genreIds;
    final String? homepage;
    final int id;
    final String? imdbId;
    final List<String>? originCountry;
    final String originalLanguage;
    final String originalTitle;
    final String overview;
    final double popularity;
    final String? posterPath;
    final List<dynamic>? productionCompanies;
    final List<ProductionCountryModel>? productionCountries;
    final DateTime releaseDate;
    final int? revenue;
    final int? runtime;
    final List<SpokenLanguage>? spokenLanguages;
    final String? status;
    final String? tagline;
    final String title;
    final bool video;
    final double voteAverage;
    final int voteCount;

    MovieModel({
        required this.adult,
        required this.backdropPath,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
        this.budget,
        this.genres,
        this.genreIds,
        this.homepage,
        this.imdbId,
        this.originCountry,
        this.productionCompanies,
        this.productionCountries,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.belongsToCollection,
    });

    MovieModel copyWith({
        bool? adult,
        String? backdropPath,
        dynamic belongsToCollection,
        int? budget,
        List<GenreModel>? genres,
        List<int>? genreIds,
        String? homepage,
        int? id,
        String? imdbId,
        List<String>? originCountry,
        String? originalLanguage,
        String? originalTitle,
        String? overview,
        double? popularity,
        String? posterPath,
        List<dynamic>? productionCompanies,
        List<ProductionCountryModel>? productionCountries,
        DateTime? releaseDate,
        int? revenue,
        int? runtime,
        List<SpokenLanguage>? spokenLanguages,
        String? status,
        String? tagline,
        String? title,
        bool? video,
        double? voteAverage,
        int? voteCount,
    }) => 
        MovieModel(
            adult: adult ?? this.adult,
            backdropPath: backdropPath ?? this.backdropPath,
            belongsToCollection: belongsToCollection ?? this.belongsToCollection,
            budget: budget ?? this.budget,
            genres: genres ?? this.genres,
            genreIds: genreIds ?? this.genreIds,
            homepage: homepage ?? this.homepage,
            id: id ?? this.id,
            imdbId: imdbId ?? this.imdbId,
            originCountry: originCountry ?? this.originCountry,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            originalTitle: originalTitle ?? this.originalTitle,
            overview: overview ?? this.overview,
            popularity: popularity ?? this.popularity,
            posterPath: posterPath ?? this.posterPath,
            productionCompanies: productionCompanies ?? this.productionCompanies,
            productionCountries: productionCountries ?? this.productionCountries,
            releaseDate: releaseDate ?? this.releaseDate,
            revenue: revenue ?? this.revenue,
            runtime: runtime ?? this.runtime,
            spokenLanguages: spokenLanguages ?? this.spokenLanguages,
            status: status ?? this.status,
            tagline: tagline ?? this.tagline,
            title: title ?? this.title,
            video: video ?? this.video,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
        );

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json["adult"] as bool,
        backdropPath: json["backdrop_path"] as String,
        belongsToCollection: json["belongs_to_collection"] as String?,
        budget: json["budget"] as int?,
        genres: json["genres"] != null ? List<GenreModel>.from(json["genres"].map((x) => GenreModel.fromJson(x))) : [],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        homepage: json["homepage"] as String?,
        id: json["id"] as int,
        imdbId: json["imdb_id"] as String?,
        originCountry: json["origin_country"] != null ? List<String>.from(json["origin_country"].map((x) => x))  : [],
        originalLanguage: json["original_language"] as String,
        originalTitle: json["original_title"] as String,
        overview: json["overview"] as String,
        popularity: json["popularity"]?.toDouble() as double,
        posterPath: json["poster_path"] as String?,
        productionCompanies: json["production_companies"] != null ? List<dynamic>.from(json["production_companies"].map((x) => x)) : [],
        productionCountries: json["production_countries"] != null ? List<ProductionCountryModel>.from(json["production_countries"].map((x) => ProductionCountryModel.fromJson(x))) : [],
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"] as int?,
        runtime: json["runtime"]as int?,
        spokenLanguages: json["spoken_languages"] != null ? List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))) : [],
        status: json["status"] as String?,
        tagline: json["tagline"] as String?,
        title: json["title"] as String,
        video: json["video"] as bool,
        voteAverage: json["vote_average"]?.toDouble() as double,
        voteCount: json["vote_count"] as int,
    );

    String posterURL() {
      API api = API();
      return api.baseImageURL + posterPath!;
    }
}
