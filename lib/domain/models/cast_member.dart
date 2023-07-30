import 'package:json_annotation/json_annotation.dart';
import 'package:screen_scape/domain/models/media_member.dart';
part "cast_member.g.dart";

@JsonSerializable()
class CastMember extends MediaMember {

  final String character;

  const CastMember({required this.character, required int id,
    required String name, String? imagePath,
    required double popularity,}) : super(id,name,imagePath,popularity);


  Map<String,dynamic> toJson() => _$CastMemberToJson(this);

  factory CastMember.fromJson(json) =>  _$CastMemberFromJson(json);
}