abstract class MoviesListState {}

class MoviesListInitial extends MoviesListState {}

class MoviesListLoading extends MoviesListState {}

class MoviesListSuccess extends MoviesListState {}

class MoviesListError extends MoviesListState {
  final String message;
  MoviesListError(this.message);
}