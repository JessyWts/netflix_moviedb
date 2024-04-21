class SpokenLanguage {
    final String englishName;
    final String iso6391;
    final String name;

    SpokenLanguage({
        required this.englishName,
        required this.iso6391,
        required this.name,
    });

    SpokenLanguage copyWith({
        String? englishName,
        String? iso6391,
        String? name,
    }) => 
        SpokenLanguage(
            englishName: englishName ?? this.englishName,
            iso6391: iso6391 ?? this.iso6391,
            name: name ?? this.name,
        );

    factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"] as String,
        iso6391: json["iso_639_1"] as String,
        name: json["name"] as String,
    );

    Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
    };
}