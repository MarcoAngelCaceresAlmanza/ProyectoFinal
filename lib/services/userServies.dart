import 'package:app_notas/models/nota.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices{
 
  Future<List<Nota>> getNotas()async{
    List<Nota> misNotas =[];
      try{
       final DataSnapshot snapshot =
         (await FirebaseDatabase.instance.ref().child('notas').once()).snapshot;
         
       if(snapshot.exists){
        
         
          print(snapshot.value);
        
       }
        return misNotas;
      }catch(e){
        return misNotas;
      }
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

  Future<bool>eliminarNota(String key) async{
    try{
      await FirebaseDatabase.instance.ref().child('notas').child(key).remove();
      return true;

    }catch(e){
      return false;
    }
  }
  
}