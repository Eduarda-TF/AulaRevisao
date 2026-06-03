import 'package:aula/pages/tela_login.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import './pages/tela_revisao.dart'; // tem que importar para o TelaRevisao funcionar


void main() { //onde o app começa, o código principal de tudo
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget { //Estático
  const MyApp({super.key}); //cria id para o flutter

  @override
  Widget build(BuildContext context) { //sempre é chamado
    return MaterialApp( //configura o app
      debugShowCheckedModeBanner: false,
      //theme, debug[...]banner, home e etc sao parametros para a ultilizacao das classes
      theme: ThemeData( //define visual - themedata: alem de componente widget, ele é uma classe
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          secondary: Colors.amber
        ),
      ),

      home: const TelaLogin(), //chama a primeira tela (tela principal)
    );
  }
}


