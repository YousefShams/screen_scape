
// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/error_handling/response_status.dart';

class ErrorHandler {

  late Failure _failure;
  late bool _hasError;

  Failure get failure => _failure;
  bool get hasError => _hasError;

  ErrorHandler(int statusCode) {
    handle(statusCode);
  }

  void handle(int statusCode) {
    _hasError = true;

    if(statusCode== StatusCodes.SUCCESS) {
      _hasError = false;
      _failure = StatusTypes.SUCCESS.getFailure();
    }

    else if(statusCode== StatusCodes.FORBIDDEN) _failure= StatusTypes.FORBIDDEN.getFailure();
    else if(statusCode== StatusCodes.NOT_FOUND) _failure= StatusTypes.NOT_FOUND.getFailure();
    else if(statusCode== StatusCodes.SERVER_ERROR) _failure= StatusTypes.SERVER_ERROR.getFailure();
    else if(statusCode== StatusCodes.UNAUTHORIZED) _failure= StatusTypes.UNAUTHORIZED.getFailure();
    else if(statusCode== StatusCodes.FORBIDDEN) _failure= StatusTypes.FORBIDDEN.getFailure();
    else if(statusCode== StatusCodes.NO_CONNECTION) _failure= StatusTypes.NO_CONNECTION.getFailure();
    else _failure= StatusTypes.UNKNOWN.getFailure();
  }

}