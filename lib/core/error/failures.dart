import 'package:dio/dio.dart';

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
    } else {
      return ServerFailure(
          "An unknown error occurred. Please try again later.");
    }
  }

  static String _mapDioErrorToMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timed out. Please check your internet connection and try again.";
      case DioExceptionType.sendTimeout:
        return "Request timed out while sending data. Please try again later.";
      case DioExceptionType.receiveTimeout:
        return "Request timed out while receiving data. Please try again.";
      case DioExceptionType.badCertificate:
        return "A certificate error occurred. Please ensure your connection is secure.";
      case DioExceptionType.badResponse:
        return _mapResponseErrorToMessage(e.response);
      case DioExceptionType.cancel:
        return "The request was canceled. Please try again.";
      case DioExceptionType.connectionError:
        return "Failed to establish a connection. Please check your network and try again.";
      case DioExceptionType.unknown:
        return "An unknown error occurred. Please try again later.";
    }
  }

  static String _mapResponseErrorToMessage(Response? response) {
    if (response == null || response.statusCode == null) {
      return "There was an error. Please try again.";
    }
    //here, you should build the model
    switch (response.statusCode) {
      // case 400:
      // case 401:
      // case 403:
      //   return response.data['error']['message'];
      case 404:
        return "The requested resource was not found. Please check the URL or try again later.";
      case 500:
        return "Internal server error. Please try again later.";
      default:
        return "Error: ${response.statusCode}. Please try again later.";
    }
  }
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure(super.errorMessage);
}

class OfflineFailure extends Failure {
  OfflineFailure(super.errorMessage);
}
