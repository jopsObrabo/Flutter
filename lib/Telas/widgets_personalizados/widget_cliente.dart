import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/campo_edicao.dart';

import 'gerencia_imagem.dart';

class WidgetCliente extends StatelessWidget {
  final dynamic controle;        // pode ser ControleTelaLogin ou ControleTelaEdicao
  final bool modoEdicao;
  final bool exibirSenha;
  final bool isSenha;
  final VoidCallback? onPressMostrarSenha;

  WidgetCliente ({
    required this.controle,
    this.isSenha = false,
    this.modoEdicao = false,
    this.exibirSenha = true,
    this.onPressMostrarSenha,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controle.formkey,   // funciona desde que ambos tenham esse campo
      child: Column(
        children: [
          // Foto
          GestureDetector(
            onTap: () async {
              await GererciaImagem().pegarLinkImagem(
                context,
                controle.controlador_foto,
              );
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  backgroundImage:
                  controle.controlador_foto.text.isNotEmpty
                      ? NetworkImage(controle.controlador_foto.text)
                      : null,
                  child: controle.controlador_foto.text.isEmpty
                      ? Icon(Icons.person, size: 45)
                      : null,
                ),
                const SizedBox(height: 5),
                const Text("Foto"),
              ],
            ),
          ),

          const SizedBox(height: 20),

          CampoEdicao("Nome", controlador: controle.controlador_nome,icone: Icons.person),
          const SizedBox(height: 15),

          CampoEdicao("E-mail",
              controlador: controle.controlador_login,
              enabled: !modoEdicao,icone: Icons.email),
          const SizedBox(height: 15),

          CampoEdicao("Telefone",
              controlador: controle.controlador_telefone,icone: Icons.phone),
          const SizedBox(height: 15),

          CampoEdicao("CPF",
              controlador: controle.controlador_cpf,icone: Icons.info_outline),
          const SizedBox(height: 15),

          if (!modoEdicao)
            CampoEdicao(
              "Senha",
              controlador: controle.controlador_senha,
              passaword: true,
              isSenha: isSenha,
              onPressedButton: onPressMostrarSenha,
            ),
        ],
      ),
    );
  }
}
