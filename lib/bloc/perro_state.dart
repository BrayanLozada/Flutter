part of 'perro_bloc.dart';

@immutable
abstract class PerrosState {}

class PerrosInicial extends PerrosState {}

class PerrosCargando extends PerrosState {}

class PerrosCargados extends PerrosState {
  final Perro perro;
  PerrosCargados({required this.perro});
}

class PerrosError extends PerrosState {
  final String mensaje;
  PerrosError({required this.mensaje});
}