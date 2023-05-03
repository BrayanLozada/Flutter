part of 'perro_bloc.dart';

@immutable
abstract class PerrosEvent {}

class PerroAgregado extends PerrosEvent {
  final Perro perro;
  PerroAgregado({required this.perro});
}