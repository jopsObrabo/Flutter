import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro_servico.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/servico.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/controle_interacao/controle_detalhes_clientes.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/tela_valor.dart';

class ListarServico extends StatelessWidget {
  Carro carro;
  CarroServico carroServico;
  Servico servico;
  TextEditingController valor = TextEditingController();
  VoidCallback? atualizarTela;

  ControleDetalhesClientes _controle = ControleDetalhesClientes();

  ListarServico({
    required this.carro,
    required this.carroServico,
    required this.servico,
    this.atualizarTela,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(servico.descricao, style: TextStyle(color: Colors.black)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Data: ${carroServico.data}",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Carro: ${carro.modelo} - ${carro.placa}",
              style: TextStyle(color: Colors.black),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => TelaValor(valor),
                    );
                    servico.valor = double.tryParse(valor.text) ?? 0;
                    servico.requisicao = true;
                    _controle.aceitarServico(servico);

                  },
                  icon: Icon(Icons.check, color: Colors.green),
                ),
                IconButton(
                  onPressed: () {
                    _controle.apagarCarroServico(carroServico, servico, carro);
                  },
                  icon: Icon(Icons.close, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
