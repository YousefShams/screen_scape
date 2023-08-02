import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/domain/models/person.dart';
import 'package:screen_scape/presentation/person/view_model/states.dart';
import '../../../data/repositories/media_repository.dart';
import '../../../domain/models/media.dart';


class PersonCubit extends Cubit<PersonState> {
  final MediaRepository mediaRepo;
  PersonCubit(this.mediaRepo) : super(PersonLoading());

  static PersonCubit get(context) => BlocProvider.of(context);

  //VARIABLES
  late Person person;
  late String? firstMovieImage;
  List<Media> viewMedia = [];

  //EVENTS
  void getPerson(int id) async {
    emit(PersonLoading());
    final result = await mediaRepo.getPersonDetails(id);
    result.fold(
       (l) {
         emit(PersonError(l.message));
       },
       (personResults) {
         person = personResults;
         firstMovieImage = getFirstMovieImage(personResults);
         viewMedia = getViewMedia(personResults);
         emit(PersonSuccess());
       }
    );
  }

  String? getFirstMovieImage(Person person) {
    final cast = person.credits.cast;
    final crew = person.credits.crew;

    if(cast.isNotEmpty) {
      cast.sort((b,a) => a.rateCount.compareTo(b.rateCount));
      return AppFunctions.getNetworkImagePath(cast.first.imgPath);
    }

    else if(crew.isNotEmpty) {
      crew.sort((b,a) => a.rateCount.compareTo(b.rateCount));
      return AppFunctions.getNetworkImagePath(crew.first.imgPath);
    }
    return null;
  }

  List<Media> getViewMedia(Person person) {
    List<Media> results = [];
    final List<Media> allMedia;

    if(person.credits.cast.length < person.credits.crew.length) {
      allMedia = [...person.credits.crew,...person.credits.cast];
    }
    else {
      allMedia = [...person.credits.cast,...person.credits.crew];
    }

    List<int> mediaIDs = [];
    for(Media media in allMedia) {
      if(! mediaIDs.contains(media.id)) {
        results.add(media);
        mediaIDs.add(media.id);
      }
    }
    return results;
  }
}