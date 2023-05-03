import 'package:flutter/material.dart';
import 'package:perro_bloc_formz/Models/perro.dart';

class MostrarPerroScreen extends StatelessWidget {
   MostrarPerroScreen({
    Key? key,
    required this.perro,
  }) : super(key: key);
  final Perro perro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(perro.nombre)));
  }
}
