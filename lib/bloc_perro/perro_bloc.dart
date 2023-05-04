import 'package:bloc/bloc.dart';


import 'package:perro_bloc_formz/Models/perro.dart';
import 'package:perro_bloc_formz/Models/perro_repository.dart';

part 'perro_event.dart';
part 'perro_state.dart';

class PerrosBloc extends Bloc<PerrosEvent, PerrosState> {
  final PerrosRepository _perrosRepository;
  PerrosBloc({ required PerrosRepository perrosRepository}) : _perrosRepository = perrosRepository, super(PerrosInicial()) {
    on<ObtenerPerro>((event, emit) async{
      emit(PerrosCargando());
      try {
        final List<Perro> perros = await _perrosRepository.obtenerPerros();
        emit(PerrosCargados(perro: perros));
        
      } catch (errorAlCargar) {
         emit(PerrosError(errorMensaje: errorAlCargar.toString() ));
      }

    });
    on<PerroAgregado>((event, emit) async {
      try {
        await _perrosRepository.agregarPerro(event.nombre);
        final List<Perro> perros  = await _perrosRepository.obtenerPerros();
        emit(PerrosCargados(perro: perros));
        
      } catch (error) {
        emit(PerrosError(errorMensaje: error.toString() ));
      }
    });
  }
}
