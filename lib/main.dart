import 'package:app_notas/pages/new_nota.dart';
import 'package:app_notas/pages/pages.dart';
import 'package:app_notas/services/appstate.dart';
import 'package:app_notas/values/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => 
runApp(MyApp());

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create:(BuildContext context)=> AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema(context),
        title: 'App Notas',
        routes:{
          '/':(_)=>HomePage(),
          'nuevo':(_)=>ModalNuevaNota(),
        },
        initialRoute: '/',
        ),
    );
  }
}