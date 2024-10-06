
import 'package:http/http.dart';

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() {
    return message;
  }
}

class BadRequestException extends ApiException {
  BadRequestException([super.message = "Bad request"]);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([super.message = "Unauthorized"]);
}

class NotFoundException extends ApiException {
  NotFoundException([super.message = "Resource not found"]);
}

class InternalServerException extends ApiException {
  InternalServerException([super.message = "Internal server error"]);
}

class FetchDataException extends ApiException {
  FetchDataException([super.message = "Error during communication"]);
}

void handleApiError(Response response) {
  switch (response.statusCode) {
    case 400:
      throw BadRequestException();
    case 401:
      throw UnauthorizedException();
    case 404:
      throw NotFoundException();
    case 500:
      throw InternalServerException();
    default:
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw FetchDataException(
            'Error occurred while communicating with the server.');
      }
  }
}
