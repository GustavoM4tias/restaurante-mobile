import 'package:equatable/equatable.dart';

abstract class UsuarioEvent extends Equatable {
  const UsuarioEvent();

  @override
  List<Object> get props => [];
}

class LoadUsuarios extends UsuarioEvent {}
