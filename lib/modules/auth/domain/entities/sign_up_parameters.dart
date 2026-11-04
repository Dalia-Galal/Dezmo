import 'package:equatable/equatable.dart';

class SignUpParameters extends Equatable{
final String name;
final String email;
final String password;
final String phone;


const SignUpParameters({
  required this.name,
  required this.email,
  required this.password,
  required this.phone,
});



  @override

  List<Object?> get props => [name ,email,password,phone];
}