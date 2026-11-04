import 'package:equatable/equatable.dart';

class SignInParameters extends Equatable{
  final String email;
  final String password;

  const SignInParameters({required this.email,required this.password});

  @override
  List<Object?> get props => [email,password];

}