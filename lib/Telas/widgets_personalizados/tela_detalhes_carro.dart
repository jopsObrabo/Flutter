import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/controle_interacao/controle_tela_carro.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/inserir_carro.dart';
import 'package:sistema_mecaniaca_inteligente/utils/widgets/nav.dart';

class TelaDetalhesCarro extends StatefulWidget {
  final String imagePath;
  final Carro dados;

  TelaDetalhesCarro({
    Key? key,
    required this.imagePath,
    required this.dados,
  });

  @override
  _TelaDetalhesCarroState createState() => _TelaDetalhesCarroState();
}

class _TelaDetalhesCarroState extends State<TelaDetalhesCarro> {

  ControleTelaCarro _controle = ControleTelaCarro();

  String nomeCliente = "Carregando...";

  @override
  void initState() {
    super.initState();
    carregarNomeCliente();
  }

  void carregarNomeCliente() async {
    final nome = await _controle.pegarNomeCliente(widget.dados.idCliente);
    setState(() {
      nomeCliente = nome;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Voltar'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Foto do carro
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: widget.imagePath.isNotEmpty
                      ? Image.network(widget.imagePath, fit: BoxFit.fill)
                      : Icon(Icons.image, size: 40),
                ),
              ),

              const SizedBox(height: 14),

              // Dono
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.black54, width: 1),
                ),
                child: Text(
                  'Dono:${nomeCliente}',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 14),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black54, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Marca: ${widget.dados.marca} ',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Modelo: ${widget.dados.modelo}',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Ano de Fabricação: ${widget.dados.ano}',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Placa:${widget.dados.placa}',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Combustível: ${widget.dados.combustivel}',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Carrocerria: ${widget.dados.carroceria}',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Quilometragem: ${widget.dados.quilometragem}',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 6),
                    /*Text('Tipo de serviço: Conserto de faróis', style: TextStyle(fontSize: 15)),
                    SizedBox(height: 8),
                    Text(
                      'Descrição: O farol direito está fraco e embaçado, e o esquerdo falha às vezes.',
                      style: TextStyle(fontSize: 14),
                    ),*/
                  ],
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    push(context, InserirCarro(inserirCarro: false,carro: widget.dados,));
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    side: const BorderSide(width: 1),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Editar'),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
