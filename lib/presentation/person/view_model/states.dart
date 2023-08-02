import 'package:screen_scape/app/services/states.dart';

abstract class PersonState {}

class PersonInitial extends PersonState {}

class PersonLoading extends PersonState {}

class PersonSuccess extends PersonState {}

class PersonError extends PersonState implements ErrorState {
  @override
  final String message;
  PersonError(this.message);
}