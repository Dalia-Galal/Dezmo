import 'package:dio/dio.dart';
import 'package:e_commerceapp/core/errors/server_failure.dart';

ServerFailure serverFailureFromDio(DioException e) {
  final data = e.response?.data;

  final message = data is Map && data['message'] != null
      ? data['message'].toString()
      : e.message ?? 'Something went wrong';

  return ServerFailure(
    statusCode: e.response?.statusCode,
    message: message,
  );
}