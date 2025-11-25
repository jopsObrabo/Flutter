import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro_servico.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/oficina.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/servico.dart';
import 'package:sistema_mecaniaca_inteligente/Service/carro_service.dart';
import 'package:sistema_mecaniaca_inteligente/Service/carro_servico_service.dart';
import 'package:sistema_mecaniaca_inteligente/Service/servico_service.dart';


class ControleCadastroServico{
  final controlador_descricao = TextEditingController();
  final controlador_data = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  ServicoService serviceServico = ServicoService();
  CarroService serviceCarro = CarroService();
  CarroServicoService serviceCarroServico = CarroServicoService();

  Future<List<Carro>> carregarVeiculo(){
    return serviceCarro.buscarPorIdCliente(user.uid);
  }

  void inserirServico(Carro carro,Oficina oficina) async{
      carro.idOficina = oficina.id;

      await serviceCarro.atualizarCarro(carro.id, carro);

      Servico servico = Servico(id: "", descricao:controlador_descricao.text,requisicao: false);

      String idServico = await serviceServico.addServico(servico);

      CarroServico cs = CarroServico(id: "", idCarro: carro.id, idCliente: user.uid
          , idOficina: oficina.id, idServico: idServico, data: controlador_data.text );

      await serviceCarroServico.addCarroServico(cs);
  }
}