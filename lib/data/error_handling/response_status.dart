// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:screen_scape/data/error_handling/failure.dart';

enum StatusTypes {
  SUCCESS,
  NOT_FOUND,
  SERVER_ERROR,
  FORBIDDEN,
  UNAUTHORIZED,
  NO_CONNECTION,
  UNKNOWN
}

extension StatusMapper on StatusTypes {
  Failure getFailure() {
    switch(this) {
      case StatusTypes.SUCCESS:
        return const Failure(StatusMessages.SUCCESS, StatusCodes.SUCCESS);
      case StatusTypes.NOT_FOUND:
        return const Failure(StatusMessages.NOT_FOUND, StatusCodes.NOT_FOUND);
      case StatusTypes.SERVER_ERROR:
        return const Failure(StatusMessages.SERVER_ERROR, StatusCodes.SERVER_ERROR);
      case StatusTypes.FORBIDDEN:
        return const Failure(StatusMessages.FORBIDDEN, StatusCodes.FORBIDDEN);
      case StatusTypes.NO_CONNECTION:
        return const Failure(StatusMessages.NO_CONNECTION, StatusCodes.NO_CONNECTION);
      case StatusTypes.UNKNOWN:
        return const Failure(StatusMessages.UNKNOWN, StatusCodes.UNKNOWN);
      default:
        return const Failure(StatusMessages.UNKNOWN, StatusCodes.UNKNOWN);
    }
  }
}

class StatusCodes {
  static const int SUCCESS = 200;
  static const int NOT_FOUND = 404;
  static const int SERVER_ERROR = 500;
  static const int FORBIDDEN = 403;
  static const int UNAUTHORIZED = 401;
  static const int NO_CONNECTION = -2;
  static const int UNKNOWN = -1;
}


class StatusMessages {
  static const SUCCESS = "Success";
  static const NOT_FOUND = "The resource is not found, try again later.";
  static const SERVER_ERROR = "Error with the server, try again later.";
  static const FORBIDDEN = "Forbidden access, try again later.";
  static const UNAUTHORIZED = "Unauthorized access, try again later.";
  static const NO_CONNECTION = "No internet connection, try again later.";
  static const UNKNOWN = "Unknown error, try again later.";

}