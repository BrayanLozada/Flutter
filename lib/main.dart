import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perro_bloc_formz/Models/perro_repository.dart';
import 'package:perro_bloc_formz/bloc/perro_bloc.dart';
import 'package:perro_bloc_formz/ui/agregar_perro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  // final perrosBloc = PerrosBloc(perrosRepository: PerrosRepository());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PerrosBloc>(
          create: (_) => PerrosBloc(perrosRepository: PerrosRepository()),
        ),
       
      ],
      child: const AgregarPerroForm(),
    );
  }
}
