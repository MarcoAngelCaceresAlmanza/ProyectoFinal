import 'package:app_notas/values/tema.dart';
import 'package:flutter/material.dart';

import '../services/userServies.dart';


class ModalNuevaNota extends StatefulWidget {
  const ModalNuevaNota({super.key});

  @override
  State<ModalNuevaNota> createState() => _ModalNuevaNotaState();
}

class _ModalNuevaNotaState extends State<ModalNuevaNota> {
  final TextEditingController _tituloController= TextEditingController();
  final TextEditingController _contenidoController= TextEditingController();
  final GlobalKey<FormState> _formularioKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: gris,
        child:Form(
          key: _formularioKey,
          child: SingleChildScrollView(

           child: Column(
             children: [
               TextFormField(
              controller: _tituloController,
              decoration: const InputDecoration(
                labelText: 'titulo de la nota'
              ),
              validator: (String? dato){
                if(dato!.isEmpty){
                  return 'Este campo es requerido';
                }
              }
            ),
            TextFormField(
              controller: _contenidoController,
              decoration: const InputDecoration(
                labelText: 'contenido'
              ),
              maxLines: 5,
              validator: (String? dato){
                if(dato!.isEmpty){
                  return 'Este campo es requerido';
                }
              }
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed:()async{

                    if(_formularioKey.currentState!.validate()){
                     bool respuesta=await UserServices().saveNotas(
                      _tituloController.text,
                      _contenidoController.text,
                     );
                     if(respuesta){
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Nota agregada correctamente'),
                          backgroundColor: Colors.green,
                          ),
                          );
                     }else{
                       Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Algo salio mal'),
                          backgroundColor: Colors.red,
                          ),
                          );
                     }
                      //TODO
                      //AGREGAR ESTO A LA BASE DE DATOS
                      //REGRESAR A LA PANTALLA ANTERIOR
                    }
                    Navigator.pop(context);
                  }, 
                  child: const Text('Aceptar'), 
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed:(){
                      Navigator.pop(context);
                    }, 
                    child: const Text('Cancelar'),
                    )
              ],
            )
          ]),
          ),
          ),
      ),
     
    );
  }
}