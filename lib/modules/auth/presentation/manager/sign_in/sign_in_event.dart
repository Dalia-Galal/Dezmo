
part of'sign_in_bloc.dart';


class SignInEvent extends Equatable {
  final SignInParameters signInParameters;
  const SignInEvent(this.signInParameters);
  @override
  List<Object?> get props => [signInParameters];
}