class ServerException implements Exception {
  final Object exception;
  ServerException(this.exception);
}

class EmptyCacheException implements Exception {
  final String errorMessage;

  EmptyCacheException({required this.errorMessage});
}
