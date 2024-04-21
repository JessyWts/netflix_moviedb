import 'package:netfix_moviedb/services/api.dart';

class PersonModel {
    final bool adult;
    final int gender;
    final int id;
    final String knownForDepartment;
    final String name;
    final String originalName;
    final double popularity;
    final String? profilePath;
    final int? castId;
    final String? character;
    final String? creditId;
    final int? order;
    final String? department;
    final String? job;

    PersonModel({
        required this.adult,
        required this.gender,
        required this.id,
        required this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        this.creditId,
        this.order,
        this.department,
        this.job,
    });

    PersonModel copyWith({
        bool? adult,
        int? gender,
        int? id,
        String? knownForDepartment,
        String? name,
        String? originalName,
        double? popularity,
        String? profilePath,
        int? castId,
        String? character,
        String? creditId,
        int? order,
        String? department,
        String? job,
    }) => 
        PersonModel(
            adult: adult ?? this.adult,
            gender: gender ?? this.gender,
            id: id ?? this.id,
            knownForDepartment: knownForDepartment ?? this.knownForDepartment,
            name: name ?? this.name,
            originalName: originalName ?? this.originalName,
            popularity: popularity ?? this.popularity,
            profilePath: profilePath ?? this.profilePath,
            castId: castId ?? this.castId,
            character: character ?? this.character,
            creditId: creditId ?? this.creditId,
            order: order ?? this.order,
            department: department ?? this.department,
            job: job ?? this.job,
        );

    factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        adult: json["adult"] as bool,
        gender: json["gender"] as int,
        id: json["id"] as int,
        knownForDepartment: json["known_for_department"] as String,
        name: json["name"] as String,
        originalName: json["original_name"] as String,
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"] as String?,
        castId: json["cast_id"] as int?,
        character: json["character"] as String?,
        creditId: json["credit_id"] as String?,
        order: json["order"] as int?,
        department: json["department"] as String?,
        job: json["job"] as String?,
    );

    String posterURL() {
      API api = API();
      return "${api.baseImageURL}$profilePath";
    }
}