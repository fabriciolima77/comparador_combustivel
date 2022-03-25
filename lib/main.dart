import 'package:comparador_combustivel/splash/splash.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    home: const SplashPage(),
    title: "Comparador de Combustível",
    theme: ThemeData(
      fontFamily: 'ProductSans',
    ),
  ));
}