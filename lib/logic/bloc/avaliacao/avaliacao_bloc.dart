import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_app/repositories/interfaces/avaliacao_repository.dart';
import 'avaliacao_event.dart';
import 'avaliacao_state.dart';

class AvaliacaoBloc extends Bloc<AvaliacaoEvent, AvaliacaoState> {
  final AvaliacaoRepository repository;

  AvaliacaoBloc(this.repository) : super(AvaliacaoInitial()) {
    on<LoadAvaliacoes>(_onLoadAvaliacoes);
  }

  Future<void> _onLoadAvaliacoes(LoadAvaliacoes event, Emitter<AvaliacaoState> emit) async {
    emit(AvaliacaoLoading());
    try {
      final avaliacoes = await repository.fetchAvaliacoes();
      emit(AvaliacaoLoaded(avaliacoes));
    } catch (e) {
      emit(AvaliacaoError('Falha ao carregar avaliações'));
    }
  }
}
