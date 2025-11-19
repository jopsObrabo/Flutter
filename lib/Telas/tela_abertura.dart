import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controle_interacao/controle_tela_abertura.dart';

class TelaAbertura extends StatefulWidget {
  @override
  _TelaAberturaState createState() => _TelaAberturaState();
}
class _TelaAberturaState extends State<TelaAbertura>{
  ControleTelaAbertura _controle = ControleTelaAbertura();

  @override
  void initState() {
    super.initState();
    _controle.inicializarAplicacao(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      alignment: Alignment.center,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/images/logo.png", fit: BoxFit.contain),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 100),
            child: Text(
              "Mecânica Fácil",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                decoration: TextDecoration.none,
              ),

            ),
          ),
          Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
  
}