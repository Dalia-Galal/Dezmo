import 'package:dio/dio.dart';
import 'package:e_commerceapp/core/network_handler/auth_interceptor.dart';
import 'package:e_commerceapp/core/storage/token_storage.dart';
import 'api_constants.dart';
import 'api_logs_interceptors.dart';
import 'api_network_interface.dart';

class DioApiClient implements ApiNetworkInterface {
  final TokenStorage _tokenStorage;
  DioApiClient(this._tokenStorage) {
    _initInterceptor();
  }
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
    ),
  );

  void _initInterceptor() {
    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Do something before request is sent.
          // If you want to resolve the request with custom data,
          // you can resolve a `Response` using `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject with a `DioException` using `handler.reject(dioError)`.
          options.headers['Content-Type'] = 'application/json';
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // Do something with response data.
          // If you want to reject the request with a error message,
          // you can reject a `DioException` object using `handler.reject(dioError)`.
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // Do something with response error.
          // If you want to resolve the request with some custom data,
          // you can resolve a `Response` object using `handler.resolve(response)`.
          return handler.next(error);
        },
      ),
      AuthInterceptor(_tokenStorage),
      ApiLogsInterceptors(),
    ]);
  }

  @override
  Future<Response> get(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(endPoint, queryParameters: queryParameters);
  }

  @override
  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return await _dio.post(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  @override
  Future<Response> postFormData(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    FormData? body,
  }) async {
    return await _dio.post(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  @override
  Future<Response> put(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return await _dio.put(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  @override
  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.delete(endpoint, queryParameters: queryParameters);
  }
}
