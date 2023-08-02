import '../../../app/services/states.dart';

abstract class WatchlistState {}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistSuccess extends WatchlistState {}

class WatchlistError extends WatchlistState implements ErrorState {
  @override
  final String message;
  WatchlistError(this.message);
}