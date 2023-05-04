import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perro_bloc_formz/bloc_perro/perro_bloc.dart';

import '../Models/perro_repository.dart';

class MostrarPerroScreen extends StatelessWidget {
  MostrarPerroScreen({super.key});

  final PerrosRepository _perrosRepository = PerrosRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Perros'),
      ),
      body: BlocProvider<PerrosBloc>(
        create: (context) => PerrosBloc(perrosRepository: _perrosRepository)
          ..add(ObtenerPerro()),
        child: BlocBuilder<PerrosBloc, PerrosState>(
          builder: (context, state) {
            if (state is PerrosCargando) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PerrosCargados) {
              final perros = state.perro;
              return ListView.builder(
                itemCount: perros.length,
                itemBuilder: (context, index) {
                  final perro = perros[index];
                  return ListTile(
                    title: Text(perro.nombre),
                  );
                },
              );
            } else if (state is PerrosError) {
              return Center(
                child: Text(state.errorMensaje),
              );
            }

            return Container();
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
    );
  }
}
