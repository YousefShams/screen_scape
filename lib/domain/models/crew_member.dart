import 'package:json_annotation/json_annotation.dart';
import 'package:screen_scape/domain/models/movie_member.dart';
part "crew_member.g.dart";

@JsonSerializable()
class CrewMember extends MovieMember {

  final String job;

  const CrewMember({required this.job, required int id,
    required String name, String? imagePath,
    required double popularity,}) : super(id,name,imagePath,popularity);


  Map<String,dynamic> toJson() => _$CrewMemberToJson(this);

  factory CrewMember.fromJson(json) =>  _$CrewMemberFromJson(json);
}