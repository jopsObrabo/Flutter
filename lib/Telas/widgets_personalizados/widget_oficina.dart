import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/campo_edicao.dart';

class WidgetOficina extends StatelessWidget{
  const WidgetOficina({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                print("clicou Avatar");
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 45),
                  ),
                  SizedBox(height: 5),
                  Text("Foto", style: TextStyle(fontSize: 14)),
                ],
              ),
            ),

            GestureDetector(
              onTap: (){
                print("Clicou Banner");
              },
              child: Column(
                children: [
                  Container(
                    width: 140,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.image, size: 40, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text("Banner", style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 15),

        CampoEdicao(
          "Nome Oficina",
          icone: Icons.settings,
        ),
        SizedBox(height: 15),

        CampoEdicao(
          "Email",
          icone: Icons.email,
        ),
        SizedBox(height: 15),

        CampoEdicao(
          "Endereço",
          icone: Icons.location_on,
        ),
        SizedBox(height: 15),

        CampoEdicao(
          "Telefone",
          icone: Icons.phone,
        ),
        SizedBox(height: 15),

        CampoEdicao(
          "Senha",
          passaword: true,
          isSenha: true,
          onPressedButton: () {},
        ),

        SizedBox(height: 25),
      ],
    );
  }

}