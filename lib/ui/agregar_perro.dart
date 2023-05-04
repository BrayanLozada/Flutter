import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perro_bloc_formz/bloc_perro/perro_bloc.dart';
import 'package:perro_bloc_formz/ui/form_perro.dart';
import 'package:perro_bloc_formz/ui/mostrar_perro.dart';

class AgregarPerroForm extends StatefulWidget {
  const AgregarPerroForm({Key? key}) : super(key: key);

  @override
  AgregarPerroFormState createState() => AgregarPerroFormState();
}

class AgregarPerroFormState extends State<AgregarPerroForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nombreController;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PerrosBloc, PerrosState>(
        builder: (context, state) {
          if (state is PerrosCargando) {
            /* Agregar lógica cuando un perro esta cargando
            Puede ser un simple mensaje que muestre que los perros 
            estan cargando.
              */
          } else if (state is PerrosCargados) {
            /* Agregar la lógica cuando un perro esta cargado*/
          } else if (state is PerrosError) {
            //Capturar el error cuando suceda
          }
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nombreController,
                  decoration:
                      const InputDecoration(labelText: 'Nombre del perro'),
                  validator: (value) {
                    return NombrePerro.dirty(value ?? '').error;
                  },
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context
                            .read<PerrosBloc>()
                            .add(PerroAgregado(nombre: _nombreController.text));
                        _mostrarDetallePerro(context);

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('perro agregado exitosamente!!')));
                      }
                    },
                    child: const Text('Agregar'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }
}

void _mostrarDetallePerro(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => MostrarPerroScreen(),
  ));
}
