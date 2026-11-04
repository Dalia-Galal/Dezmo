import 'package:e_commerceapp/core/network_handler/api_result.dart';
import 'package:e_commerceapp/modules/auth/domain/entities/sign_in_parameters.dart';
import 'package:e_commerceapp/modules/auth/domain/entities/sign_up_parameters.dart';

abstract class AuthRepository {

  Future<ApiResult<bool>> signIn({required SignInParameters data});
  Future<ApiResult<bool>> signUp({required SignUpParameters data});
  Future<ApiResult<bool>> forgetPassword({required String email});
}