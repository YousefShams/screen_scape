import 'package:json_annotation/json_annotation.dart';
import 'package:screen_scape/domain/models/media_member.dart';
import 'media_credits.dart';
part 'person.g.dart';


@JsonSerializable()
class Person extends MediaMember {
  @JsonKey(name: "known_for_department")
  final String department;

  @JsonKey(name: "biography")
  final String biography;

  @JsonKey(name: "birthday")
  final String birthday;

  @JsonKey(name: "place_of_birth")
  final String placeOfBirth;

  @JsonKey(name: "combined_credits")
  final MediaCredits credits;

  final List<String> images;

  const Person(super.id, super.name, super.imagePath, super.popularity,
      this.department, this.biography, this.birthday, this.placeOfBirth,
      this.credits, this.images);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}