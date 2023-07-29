abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {}

class MovieDetailsError extends MovieDetailsState {
  final String message;
  MovieDetailsError(this.message);
}