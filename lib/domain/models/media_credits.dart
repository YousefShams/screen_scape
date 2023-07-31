import 'package:json_annotation/json_annotation.dart';
import 'media.dart';
part 'media_credits.g.dart';

@JsonSerializable()
class MediaCredits {

  final List<Media> cast;
  final List<Media> crew;

  const MediaCredits(this.cast, this.crew);

  factory MediaCredits.fromJson(Map<String, dynamic> json) => _$MediaCreditsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MediaCreditsToJson(this);
}