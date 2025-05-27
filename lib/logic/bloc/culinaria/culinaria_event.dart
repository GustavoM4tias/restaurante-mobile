import 'package:equatable/equatable.dart';

abstract class CulinariaEvent extends Equatable {
  const CulinariaEvent();

  @override
  List<Object> get props => [];
}

class LoadCulinarias extends CulinariaEvent {}
