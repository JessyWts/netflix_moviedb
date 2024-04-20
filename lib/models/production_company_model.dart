class ProductionCompanyModel {
    final int id;
    final String logoPath;
    final String name;
    final String originCountry;

    ProductionCompanyModel({
        required this.id,
        required this.logoPath,
        required this.name,
        required this.originCountry,
    });

    ProductionCompanyModel copyWith({
        int? id,
        String? logoPath,
        String? name,
        String? originCountry,
    }) => 
        ProductionCompanyModel(
            id: id ?? this.id,
            logoPath: logoPath ?? this.logoPath,
            name: name ?? this.name,
            originCountry: originCountry ?? this.originCountry,
        );

    factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) => ProductionCompanyModel(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
    };
}