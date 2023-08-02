import '../../../app/services/states.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {}

class SearchError extends SearchState implements ErrorState {
  @override
  final String message;
  SearchError(this.message);
}
