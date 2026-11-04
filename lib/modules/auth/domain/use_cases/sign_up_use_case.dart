import 'package:e_commerceapp/core/network_handler/api_result.dart';
import 'package:e_commerceapp/modules/auth/domain/entities/sign_up_parameters.dart';
import 'package:e_commerceapp/modules/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {

  final AuthRepository _authRepository;

  const SignUpUseCase(this._authRepository);

  Future<ApiResult<bool>> call({required SignUpParameters data}){
    return _authRepository.signUp(data: data);
  }

}