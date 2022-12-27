
import 'package:app_notas/services/appstate.dart';
import 'package:app_notas/services/userServies.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/nota.dart';


class HomePage extends StatefulWidget {
      const HomePage({Key? key}):super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppState? estado;
  @override
  Widget build(BuildContext context) {
    estado=Provider.of<AppState>(context,listen:true);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Notas'),
          
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            print('object');
            Navigator.pushNamed(context, 'nuevo');
              
          },
          child: const Icon(Icons.add), ),
          
        body: FutureBuilder(
          future: estado!.obtenerNotas(),
          // future: UserServices().getNotas(),
          builder: (BuildContext context,AsyncSnapshot<List>snapshot){
           final List misnotas=snapshot.data ?? [];
            return ListView(
              children: [
            for (Nota nota in misnotas)
            ListTile(
              title: Text(nota.titulo),
              subtitle: Text(nota.contenido),
              trailing: IconButton(icon:Icon(Icons.delete,color:Colors.red),
              onPressed: (){
                estado!.deleteNota(nota.key);
              },),
            ),

            
          ],
            );
          },
        ),
        
    );
    
  }
}

