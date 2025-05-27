import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_app/repositories/interfaces/restaurante_repository.dart';
import 'restaurante_event.dart';
import 'restaurante_state.dart';

class RestauranteBloc extends Bloc<RestauranteEvent, RestauranteState> {
  final RestauranteRepository repository;

  RestauranteBloc(this.repository) : super(RestauranteInitial()) {
    on<LoadRestaurantes>(_onLoadRestaurantes);
  }

  Future<void> _onLoadRestaurantes(LoadRestaurantes event, Emitter<RestauranteState> emit) async {
    emit(RestauranteLoading());
    try {
      final restaurantes = await repository.fetchRestaurantes();
      emit(RestauranteLoaded(restaurantes));
    } catch (e) {
      emit(RestauranteError('Falha ao carregar restaurantes'));
    }
  }
}
