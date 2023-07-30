import 'package:json_annotation/json_annotation.dart';
part "media_member.g.dart";

@JsonSerializable()
class MediaMember {


  final int id;
  final String name;
  @JsonKey(name: "profile_path")
  final String? imagePath;
  final double popularity;

  const MediaMember(this.id, this.name,
      this.imagePath, this.popularity);
}