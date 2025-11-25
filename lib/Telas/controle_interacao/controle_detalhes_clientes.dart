import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro_servico.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/servico.dart';
import 'package:sistema_mecaniaca_inteligente/Service/carro_service.dart';
import 'package:sistema_mecaniaca_inteligente/Service/carro_servico_service.dart';
import 'package:sistema_mecaniaca_inteligente/Service/servico_service.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/listar_carro.dart';

import '../widgets_personalizados/listar_servico.dart';

class ControleDetalhesClientes{
  CarroServicoService serviceCarroServico = CarroServicoService();
  ServicoService serviceServico = ServicoService();
  CarroService serviceCarro = CarroService();

  final user = FirebaseAuth.instance.currentUser!;

  Future<List<ListarServico>> listarRequisicaoServico() async {
    List<CarroServico> servicoCarro = await serviceCarroServico.buscarPorOficina(user.uid);

    List<ListarServico> widgets = [];

    for (var cs in servicoCarro) {
      Servico? servico = await serviceServico.buscarPorId(cs.idServico);
      Carro? carro = await serviceCarro.buscarPorId(cs.idCarro);

      if (servico != null && servico.requisicao == false && carro != null) {
        widgets.add(ListarServico(carro: carro,carroServico: cs,servico:servico,));
      }
    }
    return widgets;
  }

  Future<void> apagarCarroServico(CarroServico cs, Servico servico, Carro carro) async {
    await serviceServico.excluirServico(servico.id);
    await serviceCarroServico.excluirCarroServico(cs.id);

    List<CarroServico> restantes = await serviceCarroServico.buscarPorCarro(carro.id);

    bool aindaTemDaMesmaOficina = restantes.any((e) => e.idOficina == cs.idOficina);

    if (!aindaTemDaMesmaOficina) {
      carro.idOficina = '';
      await serviceCarro.atualizarCarro(carro.id, carro);
    }
  }

  Future<void> aceitarServico(Servico servico) async {
    await serviceServico.atualizarServico(servico.id, servico);
  }
}