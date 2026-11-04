import 'package:dio/dio.dart';
import 'package:e_commerceapp/core/errors/server_failure.dart';
import 'package:e_commerceapp/core/network_handler/api_result.dart';
import 'package:e_commerceapp/core/network_handler/server_failure_mapper.dart';
import 'package:e_commerceapp/core/storage/token_storage.dart';
import 'package:e_commerceapp/modules/auth/data/data_sources/auth_data_source.dart';
import 'package:e_commerceapp/modules/auth/data/models/sign_in_request_model.dart';
import 'package:e_commerceapp/modules/auth/data/models/sign_up_request_model.dart';
import 'package:e_commerceapp/modules/auth/domain/entities/sign_in_parameters.dart';
import 'package:e_commerceapp/modules/auth/domain/entities/sign_up_parameters.dart';
import 'package:e_commerceapp/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource _authDataSource;
  final TokenStorage _tokenStorage;

  AuthRepositoryImp(this._authDataSource, this._tokenStorage);

  @override
  Future<ApiResult<bool>> signIn({required SignInParameters data}) async {
    try {
      final response = await _authDataSource.signInWithCredentials(
        data: SignInRequestModel.fromParameters(data),
      );

      if (response.statusCode == 200) {
        await _tokenStorage.saveToken(response.data['token'].toString());
        return ApiResult.success(data: true);
      }
      return ApiResult.failure(
        exception: ServerFailure(
          statusCode: response.statusCode,
          message: 'Unexpected response',
        ),
      );
    } on DioException catch (e) {
      return ApiResult.failure(exception: serverFailureFromDio(e));
    }
  }

  @override
  Future<ApiResult<bool>> signUp({required SignUpParameters data}) async {
    try {
      final response = await _authDataSource.signUpWithCredentials(
        data: SignUpRequestModel.fromParameters(data),
      );
      if (response.statusCode == 201) {
       // await _tokenStorage.saveToken(response.data['token'].toString());
        return ApiResult.success(data: true);
      }
      return ApiResult.failure(
        exception: ServerFailure(
          statusCode: response.statusCode,
          message: 'Unexpected response',
        ),
      );
    } on DioException catch (e) {
      return ApiResult.failure(exception: serverFailureFromDio(e));
    }
  }

  @override
  Future<ApiResult<bool>> forgetPassword({required String email}) async {
    try {
      final response = await _authDataSource.forgetPassword(email: email);

      if (response.statusCode == 200) {
        return ApiResult.success(data: true);
      }

      return ApiResult.failure(
        exception: ServerFailure(
          statusCode: response.statusCode,
          message: 'Unexpected response',
        ),
      );
    } on DioException catch (e) {
      return ApiResult.failure(exception: serverFailureFromDio(e));
    }
  }
}
