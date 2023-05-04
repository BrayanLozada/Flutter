import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perro_bloc_formz/Models/perro_repository.dart';
import 'package:perro_bloc_formz/bloc_perro/perro_bloc.dart';
import 'package:perro_bloc_formz/ui/agregar_perro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = 'App de Agregar nombre perros';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: title),

    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final PerrosRepository _perrosRepository = PerrosRepository();
  final String title;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PerrosBloc>(
          create: (_) => PerrosBloc(perrosRepository: _perrosRepository)
          ..add(ObtenerPerro())
        ),
      ],
      child: const AgregarPerroForm(),
    );
  }
}
