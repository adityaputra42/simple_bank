import 'dart:convert';

class AppException implements Exception {
  final dynamic errorResponse;

  AppException([this.errorResponse]);


  @override
  String toString() {
    return json.encode(errorResponse);
  }
}

class FetchDataException extends AppException {
  FetchDataException([super.errorResponse]);
}

class BadRequestException extends AppException {
  BadRequestException([super.errorResponse]);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([super.errorResponse]);
}

class InvalidInputException extends AppException {
  InvalidInputException([String? super.errorResponse]);
}