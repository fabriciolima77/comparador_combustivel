import 'package:comparador_combustivel/home.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    home: const Home(),
    title: "Comparador de Combustível",
    theme: ThemeData(
      primarySwatch: Colors.grey,
      fontFamily: 'ProductSans',
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black),
    ),
  ));
}