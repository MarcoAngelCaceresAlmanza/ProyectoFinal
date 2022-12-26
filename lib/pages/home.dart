
import 'package:app_notas/services/userServies.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../models/nota.dart';
import '../values/tema.dart';

class HomePage extends StatelessWidget {
      const HomePage({Key? key}):super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Notas'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            Navigator.pushNamed(context, 'nuevo');
              
          },
          child: const Icon(Icons.add), ),
          
        body: FutureBuilder(
          future: UserServices().getNotas(),
          builder: (BuildContext context,AsyncSnapshot<List>snapshot){
            List misNotas=snapshot.data ?? [];
            return ListView(
              children: [
            for (Nota nota in misNotas)
            ListTile(
              title: Text(nota.titulo),
              subtitle: Text(nota.contenido),
            ),

            
          ],
            );
          },
        ),
        
    );
    
  }
}

