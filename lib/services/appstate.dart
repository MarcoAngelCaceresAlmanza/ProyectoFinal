
import 'package:app_notas/services/userServies.dart';
import 'package:flutter/material.dart';

import '../models/nota.dart';



class AppState with ChangeNotifier{

  List<Nota> _notas=[];
  Future<List<Nota>> obtenerNotas()async{
    
      try{
        _notas= await UserServices().getNotas();
       
        return _notas;
      }catch(e){
        return _notas;
      }
  }
  
  Future<bool> saveNotas(String text, String text2) async{
    try{
      bool respuesta= await UserServices().saveNotas(text,text2);
      if(respuesta){
        notifyListeners();
      }
      return respuesta;

    }catch(e){
      return false;

    }
  }

  Future<void> deleteNota(String key)async {
    try{
     bool respuesta= await UserServices().eliminarNota(key);
     if(respuesta){
      notifyListeners();
     }

    }catch(e){
      print(e);
    }
  }

 
  

}