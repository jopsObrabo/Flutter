import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/oficina.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/controle_interacao/controle_cadastro_servico.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/campo_edicao.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/combo_box.dart';

class TelaCadastroServico extends StatefulWidget {
  Oficina oficina;
  TelaCadastroServico(this.oficina);

  @override
  State<TelaCadastroServico> createState() => _TelaCadastroServicoState();
}

class _TelaCadastroServicoState extends State<TelaCadastroServico> {
  Carro? carroSelecionado;
  ControleCadastroServico _controle = ControleCadastroServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Agendar Serviço"),
      ),

      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Combobox(future: _controle.carregarVeiculo(),
              onChanged: (Carro? carro){
              carroSelecionado = carro;
            },),
            const SizedBox(height: 20),

            CampoEdicao("Data do serviço",controlador: _controle.controlador_data,),

            const SizedBox(height: 20),

            CampoEdicao("Defina a descricao do serviço",controlador: _controle.controlador_descricao,),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  _controle.inserirServico(carroSelecionado!,widget.oficina);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                ),
                child: const Text("Agendar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
