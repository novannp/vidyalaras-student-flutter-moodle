class ServerException implements Exception {}

class AuthException implements Exception {
  String? message;

  AuthException(this.message);
}

class BadRequestException implements Exception {
  final String? message;

  BadRequestException(this.message);
}

class NotFoundException implements Exception {
  final String? message;

  NotFoundException(this.message);
}
