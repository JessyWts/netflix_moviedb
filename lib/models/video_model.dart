class VideoModel {
    final String iso6391;
    final String iso31661;
    final String name;
    final String key;
    final String site;
    final int size;
    final String type;
    final bool official;
    final DateTime publishedAt;
    final String id;

    VideoModel({
        required this.iso6391,
        required this.iso31661,
        required this.name,
        required this.key,
        required this.site,
        required this.size,
        required this.type,
        required this.official,
        required this.publishedAt,
        required this.id,
    });

    VideoModel copyWith({
        String? iso6391,
        String? iso31661,
        String? name,
        String? key,
        String? site,
        int? size,
        String? type,
        bool? official,
        DateTime? publishedAt,
        String? id,
    }) => 
        VideoModel(
            iso6391: iso6391 ?? this.iso6391,
            iso31661: iso31661 ?? this.iso31661,
            name: name ?? this.name,
            key: key ?? this.key,
            site: site ?? this.site,
            size: size ?? this.size,
            type: type ?? this.type,
            official: official ?? this.official,
            publishedAt: publishedAt ?? this.publishedAt,
            id: id ?? this.id,
        );

    factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        iso6391: json["iso_639_1"] as String,
        iso31661: json["iso_3166_1"] as String,
        name: json["name"] as String,
        key: json["key"] as String,
        site: json["site"] as String,
        size: json["size"] as int,
        type: json["type"] as String,
        official: json["official"] as bool,
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt.toIso8601String(),
        "id": id,
    };
}