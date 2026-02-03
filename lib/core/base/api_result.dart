

import 'package:tamkeen_task/core/errors/error_handlar.dart';

sealed class ApiResult<T> {
  const ApiResult();
}

class ApiSuccess<T> extends ApiResult<T> {
  final T? data;
  const ApiSuccess({this.data});
}

class ApiError<T> extends ApiResult<T> {
  final String? message;
  final Failure? failure;
  const ApiError({this.message, this.failure});
}
