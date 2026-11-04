part of'sign_up_bloc.dart';
sealed class SignUpState extends Equatable{
  const  SignUpState();
}

final class SignUpInitialState extends SignUpState{
 const SignUpInitialState();
  @override
  List<Object?> get props => [];
}
final class SignUpLoadingState extends SignUpState{
  const SignUpLoadingState();
  @override
  List<Object?> get props => [];
}
final class SignUpSuccessState extends SignUpState{
  const SignUpSuccessState();
  @override
  List<Object?> get props => [];
}
final class SignUpErrorState extends SignUpState{
  final String message;
const SignUpErrorState(this.message);
  @override
  List<Object?> get props => [message];
}
