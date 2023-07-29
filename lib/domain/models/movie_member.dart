import 'package:json_annotation/json_annotation.dart';
part "movie_member.g.dart";

@JsonSerializable()
class MovieMember {


  final int id;
  final String name;
  @JsonKey(name: "profile_path")
  final String? imagePath;
  final double popularity;

  const MovieMember(this.id, this.name,
      this.imagePath, this.popularity);
}