import 'package:e_commerceapp/modules/auth/domain/entities/sign_in_parameters.dart';

class SignInRequestModel {
  final String email;
  final String password;
  const SignInRequestModel({required this.email, required this.password});

  factory SignInRequestModel.fromParameters(SignInParameters params) {
    return SignInRequestModel(
      email: params.email,
      password: params.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
