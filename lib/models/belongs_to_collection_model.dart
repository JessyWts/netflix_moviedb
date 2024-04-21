class BelongsToCollectionModel {
    final int id;
    final String name;
    final String? posterPath;
    final String? backdropPath;

    BelongsToCollectionModel({
        required this.id,
        required this.name,
        this.posterPath,
        this.backdropPath,
    });

    BelongsToCollectionModel copyWith({
        int? id,
        String? name,
        String? posterPath,
        String? backdropPath,
    }) => 
        BelongsToCollectionModel(
            id: id ?? this.id,
            name: name ?? this.name,
            posterPath: posterPath ?? this.posterPath,
            backdropPath: backdropPath ?? this.backdropPath,
        );

    factory BelongsToCollectionModel.fromJson(Map<String, dynamic> json) => BelongsToCollectionModel(
        id: json["id"],
        name: json["name"] as String,
        posterPath: json["poster_path"] as String?,
        backdropPath: json["backdrop_path"] as String?,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
    };
}
