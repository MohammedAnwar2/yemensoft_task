class ServerException implements Exception {
  final Object exception;
  ServerException(this.exception);
}

class EmptyCacheException implements Exception {
  final String errorMessage;

  EmptyCacheException({required this.errorMessage});
}

class QueriesException implements Exception {
  final String errorMessage;

  QueriesException({required this.errorMessage});
}