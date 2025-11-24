import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/campo_edicao.dart';

import '../controle_interacao/controle_tela_login.dart';
import 'gerencia_imagem.dart';

class WidgetOficina extends StatelessWidget {
  final bool modoEdicao;           // <-- edição ou cadastro
  final bool exibirSenha;          // <-- esconda senha ao editar
  final bool isSenha;              // <-- controle de visualização
  final VoidCallback? onPressMostrarSenha;
  final dynamic controle;

  WidgetOficina({
    super.key,
    required this.controle,
    this.modoEdicao = false,
    this.exibirSenha = true,
    this.isSenha = false,
    this.onPressMostrarSenha,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controle.formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),

          // FOTO + BANNER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // FOTO
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
                          ?  Icon(Icons.person, size: 45)
                          : null,
                    ),
                    const SizedBox(height: 5),
                    const Text("Foto"),
                  ],
                ),
              ),

              // BANNER
              GestureDetector(
                onTap: () async {
                  await GererciaImagem().pegarLinkImagem(
                    context,
                    controle.controlador_banner,
                  );
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: controle.controlador_banner.text.isNotEmpty
                            ? Image.network(
                          controle.controlador_banner.text,
                          fit: BoxFit.fill,
                        )
                            :  Icon(Icons.image, size: 40),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text("Banner"),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          CampoEdicao(
            "Nome da Oficina",
            controlador: controle.controlador_nome,
            icone: Icons.settings,
          ),
          const SizedBox(height: 15),

          CampoEdicao(
            "Email",
            controlador: controle.controlador_login,
            teclado: TextInputType.emailAddress,
            icone: Icons.email,
            enabled: !modoEdicao,  // <-- 🔥 impede editar email
          ),
          const SizedBox(height: 15),

          CampoEdicao(
            "Endereço",
            controlador: controle.controlador_endereco,
            icone: Icons.location_on,
          ),
          const SizedBox(height: 15),

          CampoEdicao(
            "Telefone",
            controlador: controle.controlador_telefone,
            icone: Icons.phone,
          ),
          const SizedBox(height: 15),

          if (exibirSenha && !modoEdicao)
            CampoEdicao(
              "Senha",
              controlador: controle.controlador_senha,
              passaword: true,
              isSenha: isSenha,
              onPressedButton: onPressMostrarSenha,
            ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
