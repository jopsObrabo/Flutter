import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/controle_interacao/controle_tela_edicao.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/widget_cliente.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/widget_oficina.dart';

class TelaEditarUsuario extends StatefulWidget {
  String tipo;
  TelaEditarUsuario(this.tipo, {super.key});
  @override
  _TelaEditarUsuarioState createState() => _TelaEditarUsuarioState();
}

class _TelaEditarUsuarioState extends State<TelaEditarUsuario> {
  ControleTelaEdicao _controle = ControleTelaEdicao();

  @override
  void initState() {
    super.initState();
    _controle.carregarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.tipo,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: widget.tipo == "Cliente"
            ? WidgetCliente(
                modoEdicao: true,
                exibirSenha: false,
                controle: _controle,
              )
            : WidgetOficina(
                modoEdicao: true,
                exibirSenha: false,
                controle: _controle,
              ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _controle.atualizarUsuario(widget.tipo);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Operação Realizada!")),
                );
              },
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
                "Editar",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
