
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../models/nota.dart';
import '../values/tema.dart';

class HomePage extends StatelessWidget {
 
  List<Nota> misNotas=[
    Nota(titulo: 'titulo 1',contenido: 'Contenido de la nota 1'),
    Nota(titulo: 'titulo 2',contenido: 'Contenido de la nota 2'),
    Nota(titulo: 'titulo 3',contenido: 'Contenido de la nota 3'),
    Nota(titulo: 'titulo 4',contenido: 'Contenido de la nota 4')

 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Notas'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ModalNuevaNota();
              });
              
          },
          child:Icon(Icons.add), ),
          
        body: ListView(
          children: [
            for (Nota nota in misNotas)
            ListTile(
              title: Text(nota.titulo!),
              subtitle: Text(nota.contenido!),
            ),

            
          ],
        )
    );
    
  }
}

class ModalNuevaNota extends StatefulWidget {
  @override
  State<ModalNuevaNota> createState() => _ModalNuevaNotaState();
}

class _ModalNuevaNotaState extends State<ModalNuevaNota> {
  final TextEditingController _tituloController=new TextEditingController();

  final TextEditingController _contenidoController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //height: 300,
      color: gris,
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: _tituloController,
              decoration: 
              InputDecoration(labelText: 'Titulo de la nota'),
            ),
            TextFormField(
              controller: _contenidoController,
              decoration: const InputDecoration(
               labelText: 'Contenido' 
              ),
              maxLines: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed:(){
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text('Nota Agregada corectamente'),
                      ),

                    );
                  },
                  child: Text('Aceptar'),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                     onPressed:(){
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar'),),
                  

              ],
            )
          ],)
        ),
    );
  }

 @override
 void dispose() {
    _contenidoController.dispose();
    _tituloController.dispose();
   dispose();
 }
 }