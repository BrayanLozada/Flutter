import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:perro_bloc_formz/Models/perro.dart';
import 'package:perro_bloc_formz/Models/perro_repository.dart';

part 'perro_event.dart';
part 'perro_state.dart';

class PerrosBloc extends Bloc<PerrosEvent, PerrosState> {
  final PerrosRepository perrosRepository;
  PerrosBloc({ required this.perrosRepository}) : super(PerrosInicial()) {
    on<PerroAgregado>((event, emit) async {
      try {
        final perro = await perrosRepository.agregarPerro(event.perro);
        emit(PerrosCargados(perro: perro));
        
      } catch (error) {
        emit(PerrosError(mensaje: error.toString() ));
      }
    });
  }
}
