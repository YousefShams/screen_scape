import '../../../app/services/states.dart';

abstract class MediaDetailsState {}

class MediaDetailsInitial extends MediaDetailsState {}

class MediaDetailsLoading extends MediaDetailsState {}

class MediaDetailsSuccess extends MediaDetailsState {}

class MediaDetailsError extends MediaDetailsState implements ErrorState {
  @override
  final String message;
  MediaDetailsError(this.message);
}