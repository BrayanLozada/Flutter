import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perro_bloc_formz/Models/perro.dart';
import 'package:perro_bloc_formz/bloc/perro_bloc.dart';
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
    return BlocListener<PerrosBloc, PerrosState>(
      listener: (context, state) {
        if (state is PerrosCargando) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Cargando...')));
        } else if (state is PerrosCargados) {
         
            _mostrarDetallePerro(context, state.perro);
    
        } else if (state is PerrosError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Error: ${state.mensaje}')));
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration:
                    const InputDecoration(labelText: 'Nombre del perro'),
                validator: (value) {
                  return NombrePerro.dirty(value ?? '')
                      .error; //NombrePerro.dirty().error;
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      context.read<PerrosBloc>().add(PerroAgregado(
                          perro: Perro(nombre: _nombreController.text))
                          
                          );
                          print("agregado exitosamente!!");
                     
                    }
                  
                  },
                  child: const Text('Agregar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }
}
void _mostrarDetallePerro(BuildContext context, Perro perro) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) =>  MostrarPerroScreen(perro: perro),
  ));
}

