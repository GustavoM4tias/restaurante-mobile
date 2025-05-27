import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_app/models/usuario.dart';
import 'usuario_event.dart';
import 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final Usuario repository;

  UsuarioBloc(this.repository) : super(UsuarioInitial()) {
    on<LoadUsuarios>(_onLoadUsuarios);
  }

  Future<void> _onLoadUsuarios(LoadUsuarios event, Emitter<UsuarioState> emit) async {
    emit(UsuarioLoading());
    try {
      final usuarios = await repository.fetchUsuarios();
      emit(UsuarioLoaded(usuarios));
    } catch (e) {
      emit(UsuarioError('Falha ao carregar usuários'));
    }
  }
}
