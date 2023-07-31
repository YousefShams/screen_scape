
import 'package:screen_scape/domain/models/media_member.dart';
import 'media.dart';

class SearchResults {
  final List<Media> media;
  final List<MediaMember> persons;
  const SearchResults(this.media, this.persons);
}