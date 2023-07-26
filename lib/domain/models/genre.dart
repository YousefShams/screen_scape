class Genre {
  final String name;
  final int id;

  const Genre(this.name, this.id);

  factory Genre.fromJson(json) {
    return Genre(json["name"], json["id"]);
  }

  Map<String, dynamic> toJson() {
    return { "name" : name, "id" : id };
  }
}