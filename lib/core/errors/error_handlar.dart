import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioExcep) {
    switch (dioExcep.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad SSL certificate error');
      case DioExceptionType.badResponse:
      
        return ServerFailure.fromResponse(
          dioExcep.response!.statusCode!,
          dioExcep.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request to ApiServer cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'There is no internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage: 'UnExcepted error , Please try again',
        );
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic jsonData) {
  String? message;

  // Try to extract message from response if it exists
  if (jsonData is Map<String, dynamic>) {
    message = jsonData['message']?.toString();
  } else if (jsonData is String) {
    message = jsonData;
  }

  switch (statusCode) {
    case 400:
      return ServerFailure(
        errorMessage: message ?? 'Bad request. Please check your input.',
      );
    case 401:
      return ServerFailure(
        errorMessage: message ?? 'Unauthorized access. Please log in again.',
      );
    case 403:
      return ServerFailure(
        errorMessage: message ?? 'Forbidden request. You do not have permission.',
      );
    case 404:
      return ServerFailure(
        errorMessage: message ?? 'Resource not found.',
      );
    case 409:
      return ServerFailure(
        errorMessage: message ??
            'There is a conflict with the current state of the resource.',
      );
    case 422:
      return ServerFailure(
        errorMessage: message ?? 'Validation error. Please check the data provided.',
      );
    case 500:
      return ServerFailure(
        errorMessage: message ?? 'Internal server error. Please try again later.',
      );
    case 503:
      return ServerFailure(
        errorMessage: message ?? 'Service unavailable. Please try again later.',
      );
    default:
      return ServerFailure(
        errorMessage:
            message ?? 'Unexpected error (Status Code: $statusCode)',
      );
  }
}

}
