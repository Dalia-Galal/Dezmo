import 'package:e_commerceapp/core/network_handler/api_result.dart';
import 'package:e_commerceapp/modules/auth/domain/entities/sign_in_parameters.dart';
import 'package:e_commerceapp/modules/auth/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepository;

  const SignInUseCase(this._authRepository);

  Future<ApiResult<bool>> call({required SignInParameters data}) {
    return _authRepository.signIn(data: data);
  }
}
