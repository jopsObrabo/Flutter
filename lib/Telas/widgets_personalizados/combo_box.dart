
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro.dart';

class Combobox extends StatelessWidget {
  final Future<List<Carro>> future;
  final void Function(Carro?) onChanged;
  Combobox({
    required this.future,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Carro>>(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final carros = snapshot.data!;

        return DropdownButtonFormField<Carro>(
          decoration:  InputDecoration(
            labelText: "Selecione o carro",
            border: OutlineInputBorder(),
          ),
          items: carros.map((carro) {
            return DropdownMenuItem<Carro>(
              value: carro,
              child: Text("${carro.marca} ${carro.modelo}"),
            );
          }).toList(),
          onChanged: onChanged,
        );
      },
    );
  }
}