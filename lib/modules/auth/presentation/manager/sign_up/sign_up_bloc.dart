import 'dart:async';

import 'package:e_commerceapp/core/network_handler/api_result.dart';
import 'package:e_commerceapp/modules/auth/domain/entities/sign_up_parameters.dart';
import 'package:e_commerceapp/modules/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_up_state.dart';
part 'sign_up_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;
  SignUpBloc(this._signUpUseCase) : super(SignUpInitialState()) {
    on<SignUpEvent>(_signUpEvent);
  }

  FutureOr<void> _signUpEvent(
    SignUpEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoadingState());

    final result = await _signUpUseCase(data: event.signUpParameters);

    switch (result) {
      case ApiSuccess():
        emit(SignUpSuccessState());

      case ApiFailure(:final exception):
        emit(SignUpErrorState(exception.message));
    }
  }
}
