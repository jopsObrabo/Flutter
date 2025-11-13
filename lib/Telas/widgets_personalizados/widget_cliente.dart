import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/campo_edicao.dart';

class WidgetCliente extends StatelessWidget{
  const WidgetCliente({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),

        GestureDetector(
          onTap: (){
            print("click");
          },
          child: CircleAvatar(
            radius: 45,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 55, color: Colors.black),
          ),
        ),

        SizedBox(height: 20),

        CampoEdicao(
          "Nome Completo",
          icone: Icons.person,
        ),
        SizedBox(height: 15),

        CampoEdicao(
          "E-mail",
          icone: Icons.email,
        ),
        SizedBox(height: 15),

        CampoEdicao(
          "Telefone",
          icone: Icons.phone,
        ),
        SizedBox(height: 15),

        CampoEdicao(
          "CPF",
          icone: Icons.info_outline,
        ),
        SizedBox(height: 15),

        CampoEdicao(
          "Senha",
          passaword: true,
          isSenha: true,
          onPressedButton: () {},
        ),

        SizedBox(height: 20),
      ],
    );
  }

}