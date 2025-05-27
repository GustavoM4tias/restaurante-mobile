import 'package:equatable/equatable.dart';
import 'package:flutter_login_app/models/restaurante.dart';

abstract class RestauranteState extends Equatable {
  const RestauranteState();

  @override
  List<Object?> get props => [];
}

class RestauranteInitial extends RestauranteState {}

class RestauranteLoading extends RestauranteState {}

class RestauranteLoaded extends RestauranteState {
  final List<Restaurante> restaurantes;

  const RestauranteLoaded(this.restaurantes);

  @override
  List<Object?> get props => [restaurantes];
}

class RestauranteError extends RestauranteState {
  final String message;

  const RestauranteError(this.message);

  @override
  List<Object?> get props => [message];
}
