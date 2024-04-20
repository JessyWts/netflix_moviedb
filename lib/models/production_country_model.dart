class ProductionCountryModel {
    final String iso31661;
    final String name;

    ProductionCountryModel({
        required this.iso31661,
        required this.name,
    });

    ProductionCountryModel copyWith({
        String? iso31661,
        String? name,
    }) => 
        ProductionCountryModel(
            iso31661: iso31661 ?? this.iso31661,
            name: name ?? this.name,
        );

    factory ProductionCountryModel.fromJson(Map<String, dynamic> json) => ProductionCountryModel(
        iso31661: json["iso_3166_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
    };
}