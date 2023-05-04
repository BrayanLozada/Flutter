part of 'perro_bloc.dart';

abstract class PerrosEvent {}

class PerroAgregado extends PerrosEvent {
  final String nombre;
  PerroAgregado({required this.nombre});
}

class ObtenerPerro extends PerrosEvent{

}