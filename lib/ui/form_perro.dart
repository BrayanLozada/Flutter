import 'package:formz/formz.dart';

class NombrePerro extends FormzInput<String, String> {
  const NombrePerro.pure() : super.pure('');
  const NombrePerro.dirty([String value = '']) : super.dirty(value);

  static final _nombreRegExp = RegExp(r'^[a-zA-Z ]+$');

  @override
  String? validator(String? value) {
    return _nombreRegExp.hasMatch(value ?? '')
        ? null
        : 'El nombre del perro solo puede contener letras y espacios.';
  }
}
