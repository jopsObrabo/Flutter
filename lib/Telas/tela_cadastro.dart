import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/botao_icone.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/campo_edicao.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/widget_cliente.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/widget_oficina.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  bool clienteSelecionado = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BotaoIcone(
              texto: "Usuário",
              icone: Icons.person,
              cor: clienteSelecionado ? Colors.grey[300] : Colors.white,
              ao_clicar: () {
                setState(() => clienteSelecionado = true);
              },
            ),
            SizedBox(width: 10),
            BotaoIcone(
              texto: "Oficina",
              icone: Icons.settings,
              cor: clienteSelecionado ? Colors.white : Colors.grey[300],
              ao_clicar: () {
                setState(() => clienteSelecionado = false);
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: clienteSelecionado ? WidgetCliente() : WidgetOficina(),
      ),

      bottomNavigationBar: BottomAppBar(
        child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                  elevation: 0,
                ),
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
    );
  }

}