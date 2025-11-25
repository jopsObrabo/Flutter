import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/cliente.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/controle_interacao/controle_detalhes_clientes.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/listar_servico.dart';

class TelaDetalhesClientes extends StatefulWidget {
  Cliente cliente;

  TelaDetalhesClientes(this.cliente);

  @override
  _TelaDetalhesClientesState createState() => _TelaDetalhesClientesState();
}
class _TelaDetalhesClientesState extends State<TelaDetalhesClientes> {
  ControleDetalhesClientes _controle = ControleDetalhesClientes();

  late Future<List<ListarServico>> futureLista;

  @override
  void initState() {
    super.initState();
    futureLista = _controle.listarRequisicaoServico();
  }

  void atualizarTela() {
    setState(() {
      futureLista = _controle.listarRequisicaoServico();
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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(color: Colors.blueGrey[700]),

              child: Container(
                color: Colors.black.withOpacity(0.45),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.grey[300],
                      backgroundImage:
                          (widget.cliente.foto != null && widget.cliente.foto!.isNotEmpty)
                          ? NetworkImage(widget.cliente.foto!)
                          : null,
                      child: (widget.cliente.foto == null || widget.cliente.foto!.isEmpty)
                          ? Icon(
                              Icons.person,
                              size: 55,
                              color: Colors.grey[700],
                            )
                          : null,
                    ),

                    SizedBox(height: 12),

                    // NOME
                    Text(
                      widget.cliente.nome,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      widget.cliente.email,
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Endereço: ${widget.cliente.cpf}",
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Telefone: ${widget.cliente.telefone}",
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: FutureBuilder<List<ListarServico>>(
                future: futureLista,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("Nenhum serviço encontrado"));
                  }

                  // Passa a função atualizarTela para cada item
                  return ListView(
                    children: snapshot.data!.map((item) {
                      return ListarServico(
                        carro: item.carro,
                        carroServico: item.carroServico,
                        servico: item.servico,
                        atualizarTela: atualizarTela, // <- AQUI
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
