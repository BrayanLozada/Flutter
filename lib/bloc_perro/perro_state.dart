part of 'perro_bloc.dart';

abstract class PerrosState {}

class PerrosInicial extends PerrosState {}

class PerrosCargando extends PerrosState {}

class PerrosCargados extends PerrosState {
   final List<Perro> perro;
  PerrosCargados({required this.perro});
}

class PerrosError extends PerrosState {
  final String errorMensaje;
  PerrosError({required this.errorMensaje});
}