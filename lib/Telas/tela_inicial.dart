import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/cliente.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/inserir_carro.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/menu_lateral.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/campo_edicao.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/listar_carro.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/listar_na_tela.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/widget_listar.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/widget_listar_carro.dart';
import 'package:sistema_mecaniaca_inteligente/utils/widgets/nav.dart';

import 'controle_interacao/controle_tela_principal.dart';

class TelaPrincipal extends StatefulWidget {
  var usuarios;
  TelaPrincipal(this.usuarios);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  late ControleTelaPrincipal _controle;
  int _indiceSelecionado = 0;

  @override
  void initState() {
    super.initState();
    _controle = ControleTelaPrincipal(widget.usuarios);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 250,
          height: 48,
          child: CampoEdicao(
            "Pesquisar",
            controlador: _controle.controlador_pesquisa,
            passaword: true,
            onPressedButton: () async {
              var resultado;
              if (_indiceSelecionado == 0) {
                resultado = await _controle.pesquisarNome();
              } else {
                resultado = await _controle.pesquisarPlaca();
              }
              if (resultado == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Nenhum resultado encontrado!")),
                );
                return;
              }

              push(
                context,
                Scaffold(
                  appBar: AppBar(title: Text("Resultado da busca")),
                  body: SizedBox(
                    height: 120,
                    child: _indiceSelecionado == 0
                        ? WidgetListar(resultado)
                        : WidgetListarCarro(resultado),
                  ),
                ),
              );
            },
            icone: Icons.search,
          ),
        ),
      ),
      body: _body(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indiceSelecionado,
        onTap: (index) {
          setState(() {
            _indiceSelecionado = index;
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: Colors.red),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_repair_outlined),
            activeIcon: Icon(Icons.car_repair, color: Colors.red),
            label: "Carros",
          ),
        ],
      ),
      drawer: MenuLateral(widget.usuarios),
    );
  }

  Widget _body() {
    switch (_indiceSelecionado) {
      case 0:
        return _paginaHome();
      case 1:
        return _paginaCarros();
      default:
        return Center(child: Text("Página não encontrada"));
    }
  }

  Widget _paginaHome() {
    return Column(
      children: [
        Expanded(
          child: ListarNaTela(
            stream: _controle.streamListar(),
            builder: (dados) => WidgetListar(dados),
          ),
        ),
      ],
    );
  }

  Widget _paginaCarros() {
    return Column(
      children: [
        Expanded(
          child: ListarCarro(
            future: _controle.buscarVeiculo(),
            builder: (dados) => WidgetListarCarro(dados),
          ),
        ),

        if (widget.usuarios is Cliente)
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                push(context, InserirCarro());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(8),
                minimumSize: Size(60, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Icon(Icons.add),
            ),
          ),
      ],
    );
  }
}
