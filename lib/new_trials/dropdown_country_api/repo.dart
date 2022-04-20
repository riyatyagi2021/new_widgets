class CountryListModal {
  int? id;
  String? name;
  String? iso2;
  CountryListModal({
    this.id,
    this.name,
    this.iso2,
  });


  factory CountryListModal.fromJson(Map<String, dynamic> json) => CountryListModal(
    id: json["id"],
    name: json["name"],
    iso2: json["iso2"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "iso2": iso2,
  };
}