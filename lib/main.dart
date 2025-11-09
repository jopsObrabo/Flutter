import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/tela_inicial.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/tela_login.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mecanica Inteligente',
      home: TelaLogin(),
    );
  }
}
