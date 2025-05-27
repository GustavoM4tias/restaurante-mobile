import 'package:equatable/equatable.dart';

abstract class AvaliacaoEvent extends Equatable {
  const AvaliacaoEvent();

  @override
  List<Object> get props => [];
}

class LoadAvaliacoes extends AvaliacaoEvent {}
