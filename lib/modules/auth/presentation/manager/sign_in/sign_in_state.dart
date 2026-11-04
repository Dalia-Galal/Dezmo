part of'sign_in_bloc.dart';
sealed class SignInState extends Equatable {
  const SignInState();
}

final class SignInInitialState extends SignInState {
  const SignInInitialState();
  @override
  List<Object?> get props => [];

}

final class LoadingSignInState extends SignInState {
  const LoadingSignInState();
  @override
  List<Object?> get props => [];
}

final class SuccessSignInState extends SignInState {
  const SuccessSignInState();
  @override
  List<Object?> get props => [];
}

final class ErrorSignInState extends SignInState {
  final String message;
  const ErrorSignInState(this.message);
  @override
  List<Object?> get props => [message];
}