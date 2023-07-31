import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/resources/app_databases_keys.dart';
import 'package:screen_scape/domain/models/person.dart';
import 'package:screen_scape/presentation/person/view_model/states.dart';
import '../../../data/repositories/media_repository.dart';


class PersonCubit extends Cubit<PersonState> {
  final MediaRepository mediaRepo;
  PersonCubit(this.mediaRepo) : super(PersonInitial());

  static PersonCubit get(context) => BlocProvider.of(context);

  //VARIABLES
  late Person person;

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
         emit(PersonSuccess());
       }
    );
  }



}