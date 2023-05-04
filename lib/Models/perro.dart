class Perro {
  final String nombre;

  Perro({required this.nombre});

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
    };
  }
}
