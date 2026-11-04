part of 'sign_up_bloc.dart';

class SignUpEvent extends Equatable {
  final SignUpParameters signUpParameters;
  const  SignUpEvent(this.signUpParameters);

  @override
  List<Object?> get props => [signUpParameters];
}