import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:e_commerceapp/core/network_handler/api_result.dart';
import 'package:e_commerceapp/modules/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/forget_password/forget_password_event.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/forget_password/forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  ForgetPasswordBloc(this._forgetPasswordUseCase)
    : super(ForgetPasswordInitialState()) {
    on<ForgetPasswordEvent>(_onForgetPasswordEvent);
  }
  FutureOr<void> _onForgetPasswordEvent(
    ForgetPasswordEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    emit(ForgetPasswordLoadingState());
    final result = await _forgetPasswordUseCase(email: event.email);

    switch (result) {
      case ApiSuccess():
        emit(ForgetPasswordSuccessState());
      case ApiFailure(:final exception):
        emit(ForgetPasswordErrorState(exception.message));
    }
  }
}
