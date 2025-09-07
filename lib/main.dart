import 'package:flutter/material.dart';
import 'package:flutter_application_1/BackEnd.dart';
import 'package:flutter_application_1/apresentacao.dart';
import 'package:http/http.dart' as http;
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override


  Widget build(BuildContext context) {

    return MaterialApp(
    debugShowCheckedModeBanner: false, 
      home: Comeco(),
      );     
  }
}
