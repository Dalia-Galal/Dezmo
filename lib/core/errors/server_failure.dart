import 'dart:convert';

import 'package:e_commerceapp/core/errors/failure.dart';

class ServerFailure extends Failure {
  final String? error;
  final String? errorCode;
  final String? errorMessage;
  const ServerFailure({
    required super.statusCode,
    required super.message,
    this.error,
    this.errorCode,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [...super.props, error, errorCode, errorMessage];
}
