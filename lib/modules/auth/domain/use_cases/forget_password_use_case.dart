import 'package:e_commerceapp/core/network_handler/api_result.dart';
import 'package:e_commerceapp/modules/auth/domain/repositories/auth_repository.dart';

class ForgetPasswordUseCase {
  final AuthRepository _authRepository;

  const ForgetPasswordUseCase(this._authRepository);

  Future<ApiResult<bool>> call({required String email}) {
    return _authRepository.forgetPassword(email: email);
  }
}