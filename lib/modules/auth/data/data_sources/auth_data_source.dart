import 'package:dio/dio.dart';
import 'package:e_commerceapp/modules/auth/data/models/sign_in_request_model.dart';
import 'package:e_commerceapp/modules/auth/data/models/sign_up_request_model.dart';

abstract class AuthDataSource {
  Future<Response> signInWithCredentials({required SignInRequestModel data});
  Future<Response> signUpWithCredentials({required SignUpRequestModel data});
  Future<Response> forgetPassword({required String email});
}
