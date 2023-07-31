abstract class PersonState {}

class PersonInitial extends PersonState {}

class PersonLoading extends PersonState {}

class PersonSuccess extends PersonState {}

class PersonError extends PersonState {
  final String message;
  PersonError(this.message);
}