import 'package:dio/dio.dart';

abstract interface class ApiNetworkInterface {
  Future<dynamic> get(
      String endPoint, {
      Map<String, dynamic>? queryParameters,
      });

  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  });
  Future<dynamic> postFormData(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    FormData? body,
  });
  Future<dynamic> put(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  });
  Future<dynamic> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });
}
