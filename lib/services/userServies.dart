import 'package:app_notas/models/nota.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices{
  Future<List<Nota>> getNotas()async{
    List<Nota> misNotas;
    misNotas= [
    Nota(titulo: 'titulo 1',contenido: 'Contenido de la nota 1'),
    Nota(titulo: 'titulo 2',contenido: 'Contenido de la nota 2'),
    Nota(titulo: 'titulo 3',contenido: 'Contenido de la nota 3'),
    Nota(titulo: 'titulo 4',contenido: 'Contenido de la nota 4')

      ];
      return  misNotas;
  }

  Future<bool> saveNotas(String titulo, String contenido) async{
    try{
    await FirebaseDatabase.instance.ref()
    
    .child('notas')
    .push()
    .set(
      {'title':titulo,'body':contenido}
    );return true;
    }catch(e){
      print(e);
      return false;
    }
  }
  
}