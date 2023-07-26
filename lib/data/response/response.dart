class BaseResponse {
  final int statusCode;
  const BaseResponse(this.statusCode);
}


class MovieResponse extends BaseResponse {

  final Map<String,dynamic> data;
  const MovieResponse(this.data, {required int status}) : super(status);

}

class MoviesListResponse extends BaseResponse {

  final List<Map<String,dynamic>> data;
  const MoviesListResponse(this.data, {required int status}) : super(status);

}