import 'package:equatable/equatable.dart';

class ForgetPasswordEvent extends Equatable {
  final String email;
  const ForgetPasswordEvent(this.email);

  @override

  List<Object?> get props => [email];
}