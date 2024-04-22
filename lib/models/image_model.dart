import 'dart:convert';

import 'package:netfix_moviedb/services/api.dart';

ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

class ImageModel {
    final List<Backdrop>? backdrops;
    final int? id;
    final List<dynamic>? logos;
    final List<Backdrop>? posters;

    ImageModel({
        required this.backdrops,
        this.id,
        required this.logos,
        required this.posters,
    });

    ImageModel copyWith({
        List<Backdrop>? backdrops,
        int? id,
        List<dynamic>? logos,
        List<Backdrop>? posters,
    }) => 
        ImageModel(
            backdrops: backdrops ?? this.backdrops,
            id: id ?? this.id,
            logos: logos ?? this.logos,
            posters: posters ?? this.posters,
        );

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        backdrops: json["backdrops"] != null ? List<Backdrop>.from(json["backdrops"].map((x) => Backdrop.fromJson(x))) : [],
        id: json["id"] as int?,
        logos: json["logos"] != null ? List<dynamic>.from(json["logos"].map((x) => x)) : [],
        posters: json["posters"] != null ? List<Backdrop>.from(json["posters"].map((x) => Backdrop.fromJson(x))) : [],
    );
}

class Backdrop {
    final double aspectRatio;
    final int height;
    final dynamic iso6391;
    final String filePath;
    final double voteAverage;
    final int voteCount;
    final int width;

    Backdrop({
        required this.aspectRatio,
        required this.height,
        required this.iso6391,
        required this.filePath,
        required this.voteAverage,
        required this.voteCount,
        required this.width,
    });

    Backdrop copyWith({
        double? aspectRatio,
        int? height,
        dynamic iso6391,
        String? filePath,
        double? voteAverage,
        int? voteCount,
        int? width,
    }) => 
        Backdrop(
            aspectRatio: aspectRatio ?? this.aspectRatio,
            height: height ?? this.height,
            iso6391: iso6391 ?? this.iso6391,
            filePath: filePath ?? this.filePath,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
            width: width ?? this.width,
        );

    factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "iso_639_1": iso6391,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
    };

    String posterURL() {
      API api = API();
      return api.baseImageURL + filePath;
    }
}
