import 'cast_member.dart';
import 'crew_member.dart';

class Credits {

  final List<CastMember> cast;
  final List<CrewMember> crew;

  const Credits(this.cast,this.crew);

  void removeAllCrewsButDirector() {
    crew.removeWhere((member) => member.job.toLowerCase() !=
        "director");
  }

}