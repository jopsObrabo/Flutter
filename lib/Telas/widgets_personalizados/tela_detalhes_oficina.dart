import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/oficina.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/tela_cadstro_servi%C3%A7o.dart';
import 'package:sistema_mecaniaca_inteligente/utils/widgets/nav.dart';

class TelaDetalhesOficna extends StatelessWidget {
  Oficina oficina;
  TelaDetalhesOficna(this.oficina);

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
              decoration: BoxDecoration(
                image: oficina.banner != null && oficina.banner!.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(oficina.banner!),
                        fit: BoxFit.cover,
                      )
                    : null,
                color: Colors.blueGrey[700],
              ),

              child: Container(
                color: Colors.black.withOpacity(0.45),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.grey[300],
                      backgroundImage:
                          (oficina.foto != null && oficina.foto!.isNotEmpty)
                          ? NetworkImage(oficina.foto!)
                          : null,
                      child: (oficina.foto == null || oficina.foto!.isEmpty)
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
                      oficina.nome,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      oficina.email,
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.grey[100],
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Endereço: ${oficina.endereco}",
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Telefone: ${oficina.telefone}",
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(46),
        child: ElevatedButton(
          onPressed: () {
            push(context, TelaCadastroServico(oficina));
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(60, 30),
            backgroundColor: Colors.grey[300],
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
          ),
          child: Text("Solicitar Serviço"),
        ),
      ),
    );
  }
}
