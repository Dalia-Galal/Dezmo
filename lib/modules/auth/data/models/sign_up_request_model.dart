import 'package:e_commerceapp/modules/auth/domain/entities/sign_up_parameters.dart';

class SignUpRequestModel {
  final String name;
  final String email;
  final String password;
  final String phone;

  const SignUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });
  factory SignUpRequestModel.fromParameters(SignUpParameters params) {
    return SignUpRequestModel(
      name: params.name,
      email: params.email,
      password: params.password,
      phone: params.phone,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "rePassword": password,
      "phone": phone,
    };
  }
}
