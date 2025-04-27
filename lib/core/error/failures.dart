import 'package:dio/dio.dart';
import 'package:yemensoft_task/core/error/exceptions.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.handleException(Object e) {
    if (e is DioException) {
      final errorMessage = _mapDioErrorToMessage(e);
      return ServerFailure(errorMessage);
    } else if (e is ServerException) {
      return ServerFailure(e.exception.toString());
    } else {
      return ServerFailure(
        'An unexpected error occurred. Please try again later.',
      );
    }
  }

static String _mapDioErrorToMessage(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return "Connection timed out. Please check your internet connection and try again. 📡⏳";
    case DioExceptionType.sendTimeout:
      return "Request timed out while sending data. Please ensure a stable connection and try again later. 📤⏰";
    case DioExceptionType.receiveTimeout:
      return "Request timed out while receiving data. Please check your network and try again. 📥⏳";
    case DioExceptionType.badCertificate:
      return "A certificate error occurred. Please ensure your connection is secure or contact support. 🔒⚠️";
    case DioExceptionType.badResponse:
      return _mapResponseErrorToMessage(e.response); 
    case DioExceptionType.cancel:
      return "The request was canceled unexpectedly. Please try again to continue. 🚫🔄";
    case DioExceptionType.connectionError:
      return "No internet connection. Please connect to a network and try again. 📴🌐";
    case DioExceptionType.unknown:
      return "An unknown error occurred. Please try again later or contact support if the issue persists. ❓🤔";
  }
}

  static String _mapResponseErrorToMessage(Response? response) {
    if (response == null || response.statusCode == null) {
      return "There was an unexpected error. Please try again later. 😔🔧";
    }
    switch (response.statusCode) {
      case 400:
        return "Bad request. The data you provided seems invalid. Please check your input and try again. 📝❌";
      case 401:
        return "Unauthorized access. Please log in again to continue. 🔒🚪";
      case 403:
        return "Forbidden. You don’t have permission to access this resource. Please contact support if needed. 🚫👮";
      case 404:
        return "The requested resource was not found. Please check the URL or try again later. 🔍❓";
      case 500:
        return "Internal server error. Our team is working on it. Please try again later. 🛠️⏳";
      default:
        return "An error occurred. Please try again later or contact support. ⚠️📞";
    }
  }

}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure(super.errorMessage);
}

class QueriesFailure extends Failure {
  QueriesFailure(super.errorMessage);
}

class OfflineFailure extends Failure {
  OfflineFailure(super.errorMessage);
}
