
class BaseResponse {
  final int statusCode;
  const BaseResponse(this.statusCode);
}


class MediaResponse extends BaseResponse {
  final Map<String,dynamic> data;
  const MediaResponse(this.data, {required int status}) : super(status);
}

class MediaListResponse extends BaseResponse {
  final List<Map<String,dynamic>> data;
  const MediaListResponse(this.data, {required int status}) : super(status);
}

class MediaListLocalResponse {
  final List<Map<dynamic,dynamic>> data;
  const MediaListLocalResponse(this.data);
}

class MovieResponse extends MediaResponse {
  MovieResponse(super.data, {required super.status});
}

class MovieListResponse extends MediaResponse {
  MovieListResponse(super.data, {required super.status});
}

class TVShowResponse extends MediaResponse {
  TVShowResponse(super.data, {required super.status});
}

class TVShowListResponse extends MediaResponse {
  TVShowListResponse(super.data, {required super.status});
}

class ImagesListResponse extends BaseResponse {
  final List<Map<String,dynamic>> data;
  const ImagesListResponse(this.data, {required int status}) : super(status);
}

class CreditsResponse extends BaseResponse {
  final Map<String,dynamic> data;
  const CreditsResponse(this.data, {required int status}) : super(status);
}

class VideosResponse extends BaseResponse {
  final Map<String,dynamic> data;
  const VideosResponse(this.data, {required int status}) : super(status);
}

class SearchResponse extends BaseResponse {
  final List<Map<String,dynamic>> data;
  const SearchResponse(this.data, {required int status}) : super(status);
}

class PersonResponse extends BaseResponse {
  final Map<String,dynamic> data;
  const PersonResponse(this.data, {required int status}) : super(status);
}

