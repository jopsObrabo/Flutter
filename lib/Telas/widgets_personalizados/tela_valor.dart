
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/campo_edicao.dart';

class TelaValor extends StatelessWidget{
  TextEditingController valor;

  TelaValor(this.valor);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text("Insira o valor do Serviço"),
      content: CampoEdicao("Valor",controlador:valor,),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    );
  }
}
