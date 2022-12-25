import 'package:app_notas/pages/pages.dart';
import 'package:app_notas/values/tema.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: miTema(context),
      title: 'App Notas',
      home: HomePage(),
      );
  }
}