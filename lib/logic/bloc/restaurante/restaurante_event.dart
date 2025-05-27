import 'package:equatable/equatable.dart';

abstract class RestauranteEvent extends Equatable {
  const RestauranteEvent();

  @override
  List<Object> get props => [];
}

class LoadRestaurantes extends RestauranteEvent {}
