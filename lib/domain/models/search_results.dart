
import 'package:screen_scape/domain/models/media_member.dart';
import 'media.dart';

class SearchResults {
  List<Media> media;
  List<MediaMember> persons;
  SearchResults(this.media, this.persons);

  void update(SearchResults searchResults) {
    media.addAll(searchResults.media);
    persons.addAll(searchResults.persons);
  }
  void clear() {
    media.clear();
    persons.clear();
  }
}