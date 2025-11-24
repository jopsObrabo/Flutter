import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro.dart';

class ListarCarro extends StatelessWidget{
   final Future<List<Carro>> future;
   final Widget Function(Carro) builder;
   ListarCarro({required this.future,required this.builder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: future, builder:  (context, snapshot) {
      if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

      final dados = snapshot.data!;
      return ListView.builder(
        itemCount: dados.length,
        itemBuilder: (context, index) => builder(dados[index]),
      );

    });
  }


}