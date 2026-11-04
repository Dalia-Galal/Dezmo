import 'package:equatable/equatable.dart';

sealed class ForgetPasswordState extends Equatable{

  const ForgetPasswordState();

}
class ForgetPasswordInitialState extends ForgetPasswordState{
  const ForgetPasswordInitialState();
  @override
  List<Object?> get props => [];
}
class ForgetPasswordLoadingState extends ForgetPasswordState{
  const ForgetPasswordLoadingState();
  @override

  List<Object?> get props => [];

}
class ForgetPasswordSuccessState extends ForgetPasswordState{
  const ForgetPasswordSuccessState();
  @override

  List<Object?> get props => [];

}
class ForgetPasswordErrorState extends ForgetPasswordState{
  final String message;
  const ForgetPasswordErrorState(this.message);
  @override

  List<Object?> get props => [message];

}