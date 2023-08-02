import '../../../app/services/states.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeUpdateState extends HomeState {}


class HomeErrorState extends HomeState implements ErrorState {
  @override
  final String message;
  HomeErrorState(this.message);
}