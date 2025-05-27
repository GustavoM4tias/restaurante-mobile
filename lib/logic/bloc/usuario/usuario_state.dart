import 'package:equatable/equatable.dart';
import 'package:flutter_login_app/models/usuario.dart';

abstract class UsuarioState extends Equatable {
  const UsuarioState();

  @override
  List<Object?> get props => [];
}

class UsuarioInitial extends UsuarioState {}

class UsuarioLoading extends UsuarioState {}

class UsuarioLoaded extends UsuarioState {
  final List<Usuario> usuarios;

  const UsuarioLoaded(this.usuarios);

  @override
  List<Object?> get props => [usuarios];
}

class UsuarioError extends UsuarioState {
  final String message;

  const UsuarioError(this.message);

  @override
  List<Object?> get props => [message];
}
