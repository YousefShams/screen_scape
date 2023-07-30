import 'package:json_annotation/json_annotation.dart';
part 'media_video.g.dart';

@JsonSerializable()
class MediaVideo {

  final String name;
  final String site;
  final String key;
  final bool official;
  final int size;
  final String type;

  const MediaVideo(this.name, this.site, this.key, this.official,
      this.size, this.type);

  factory MediaVideo.fromJson(Map<String, dynamic> json) => _$MediaVideoFromJson(json);
  Map<String, dynamic> toJson() => _$MediaVideoToJson(this);
}