import 'package:e_commerceapp/core/errors/failure.dart';

sealed class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success({required T data}) = ApiSuccess<T>;
  factory ApiResult.failure({required Failure exception}) = ApiFailure<T>;
}
class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  const ApiSuccess({required this.data});
}
class ApiFailure<T> extends ApiResult<T> {
  final Failure exception;
  const ApiFailure({required this.exception});
}