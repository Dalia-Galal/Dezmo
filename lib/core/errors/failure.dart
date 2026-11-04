import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final int? statusCode;
  final String message;

  const Failure({required this.statusCode, required this.message});

  @override
  List<Object?> get props => [statusCode, message];

}
