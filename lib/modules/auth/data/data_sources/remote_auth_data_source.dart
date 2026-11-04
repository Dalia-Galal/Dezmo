import 'package:dio/dio.dart';
import 'package:e_commerceapp/core/network_handler/endpoints.dart';
import 'package:e_commerceapp/modules/auth/data/data_sources/auth_data_source.dart';
import 'package:e_commerceapp/modules/auth/data/models/sign_in_request_model.dart';
import 'package:e_commerceapp/modules/auth/data/models/sign_up_request_model.dart';
import 'package:e_commerceapp/modules/auth/domain/entities/sign_in_parameters.dart';
import 'package:e_commerceapp/core/network_handler/api_network_interface.dart';

class RemoteAuthDataSource implements AuthDataSource {
  final ApiNetworkInterface _apiNetworkInterface;

  RemoteAuthDataSource(this._apiNetworkInterface);

  @override
  Future<Response> signInWithCredentials({
    required SignInRequestModel data,
  }) async {
    return await _apiNetworkInterface.post(
      Endpoints.signIn,
      body: data.toJson(),
    );
  }

  @override
  Future<Response> signUpWithCredentials({
    required SignUpRequestModel data,
  }) async {
    return await _apiNetworkInterface.post(
      Endpoints.signUp,
      body: data.toJson(),
    );
  }

  @override
  Future<Response> forgetPassword({required String email}) async {
    return await _apiNetworkInterface.post(
      Endpoints.forgetPassword,
      body: { "email":email},
    );
  }
}
