import 'package:equatable/equatable.dart';
import 'package:flutter_login_app/models/culinaria.dart';

abstract class CulinariaState extends Equatable {
  const CulinariaState();

  @override
  List<Object?> get props => [];
}

class CulinariaInitial extends CulinariaState {}

class CulinariaLoading extends CulinariaState {}

class CulinariaLoaded extends CulinariaState {
  final List<Culinaria> culinarias;

  const CulinariaLoaded(this.culinarias);

  @override
  List<Object?> get props => [culinarias];
}

class CulinariaError extends CulinariaState {
  final String message;

  const CulinariaError(this.message);

  @override
  List<Object?> get props => [message];
}
