import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:e_commerceapp/core/network_handler/api_result.dart';
import 'package:e_commerceapp/modules/auth/domain/entities/sign_in_parameters.dart';
import 'package:e_commerceapp/modules/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase _signInUseCase;
  SignInBloc(this._signInUseCase) : super((SignInInitialState())) {
    on<SignInEvent>(_onSignInEvent);
  }

  FutureOr<void> _onSignInEvent(
    SignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(LoadingSignInState());

    final result = await _signInUseCase(data: event.signInParameters);
    switch (result) {
      case ApiSuccess():
        emit(SuccessSignInState());
      case ApiFailure(:final exception):
        emit(ErrorSignInState(exception.message));
    }
  }
}
