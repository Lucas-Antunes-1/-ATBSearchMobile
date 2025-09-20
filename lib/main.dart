import 'package:flutter/material.dart';
import 'package:flutter_application_1/apresentacao.dart';
import 'package:flutter_application_1/dados.dart';
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override


  Widget build(BuildContext context) {
    Login.carregar();
    return MaterialApp(
    debugShowCheckedModeBanner: false, 
      home: Comeco(),
      );     
  }
}
