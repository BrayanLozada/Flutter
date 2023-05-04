import 'package:perro_bloc_formz/Models/perro_db.dart';
import 'package:perro_bloc_formz/Models/perro.dart';

class PerrosRepository {
  final PerroDatabase _perroDatabase = PerroDatabase();

  Future<List<Perro>> obtenerPerros() async {
    return await _perroDatabase.obtenerPerros();
  }

  Future<int> agregarPerro(String nombre) async {
    return await _perroDatabase.agregarPerro(nombre);
  }
 

  }

