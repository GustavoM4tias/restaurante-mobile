import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_app/repositories/interfaces/culinaria_repository.dart';
import 'culinaria_event.dart';
import 'culinaria_state.dart';

class CulinariaBloc extends Bloc<CulinariaEvent, CulinariaState> {
  final CulinariaRepository repository;

  CulinariaBloc(this.repository) : super(CulinariaInitial()) {
    on<LoadCulinarias>(_onLoadCulinarias);
  }

  Future<void> _onLoadCulinarias(LoadCulinarias event, Emitter<CulinariaState> emit) async {
    emit(CulinariaLoading());
    try {
      final culinarias = await repository.fetchCulinarias();
      emit(CulinariaLoaded(culinarias));
    } catch (e) {
      emit(CulinariaError('Falha ao carregar culinárias'));
    }
  }
}
