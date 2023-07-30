abstract class MediaDetailsState {}

class MediaDetailsInitial extends MediaDetailsState {}

class MediaDetailsLoading extends MediaDetailsState {}

class MediaDetailsSuccess extends MediaDetailsState {}

class MediaDetailsError extends MediaDetailsState {
  final String message;
  MediaDetailsError(this.message);
}