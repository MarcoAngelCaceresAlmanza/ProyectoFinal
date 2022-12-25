





import 'package:flutter/material.dart';

 const Color primary=Color(0xffCCE8CC);
 const Color gris=Color(0xff656256);
 const Color marron=Color(0xff230903);
 const Color morado=Color(0xffE365C1);
 const Color azul=Color(0xff001242);


 ThemeData miTema(BuildContext con){
  return ThemeData(
    primaryColor: primary,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.yellow,
    ) .copyWith(
      secondary: Colors.amber,
    )
  );
 }
