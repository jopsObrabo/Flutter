import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/campo_edicao.dart';

import '../controle_interacao/controle_tela_login.dart';

class WidgetCliente extends StatelessWidget {
  bool isSenha;
  VoidCallback? onPressedButton;
  ControleTelaLogin _controle;
  WidgetCliente(
    this.isSenha,
    this.onPressedButton,
    this._controle, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controle.formkey,
      child: Column(
        children: [

          SizedBox(height: 20),

          CampoEdicao("Nome Completo",controlador:_controle.controlador_nome_cliente, icone: Icons.person),
          SizedBox(height: 15),

          CampoEdicao(
            "E-mail",
            icone: Icons.email,
            teclado: TextInputType.emailAddress,
            controlador: _controle.controlador_login,
          ),
          SizedBox(height: 15),

          CampoEdicao("Telefone",controlador: _controle.controlador_telefone, icone: Icons.phone),
          SizedBox(height: 15),

          CampoEdicao("CPF",controlador: _controle.controlador_cpf, icone: Icons.info_outline),
          SizedBox(height: 15),

          CampoEdicao(
            "Senha",
            passaword: true,
            isSenha: isSenha,
            validador: (String? text) {
              if (text!.isEmpty)
                return "O campo '$text' está vazio e necessita ser preenchido";
              else if (text.length < 6)
                return "A senha precisa ter no mínimo 6 caracteres";
              return null;
            },
            controlador: _controle.controlador_senha,
            onPressedButton: onPressedButton,
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
