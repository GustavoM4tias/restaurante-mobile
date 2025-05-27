import 'package:equatable/equatable.dart';
import 'package:flutter_login_app/models/avaliacao.dart';

abstract class AvaliacaoState extends Equatable {
  const AvaliacaoState();

  @override
  List<Object?> get props => [];
}

class AvaliacaoInitial extends AvaliacaoState {}

class AvaliacaoLoading extends AvaliacaoState {}

class AvaliacaoLoaded extends AvaliacaoState {
  final List<Avaliacao> avaliacoes;

  const AvaliacaoLoaded(this.avaliacoes);

  @override
  List<Object?> get props => [avaliacoes];
}

class AvaliacaoError extends AvaliacaoState {
  final String message;

  const AvaliacaoError(this.message);

  @override
  List<Object?> get props => [message];
}
