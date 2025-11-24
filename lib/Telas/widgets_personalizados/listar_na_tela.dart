import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListarNaTela<T> extends StatelessWidget{
  final Stream<List<T>> stream;
  final Widget Function(T) builder;

  ListarNaTela({required this.stream, required this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<T>>(
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

        final dados = snapshot.data!;
        return ListView.builder(
          itemCount: dados.length,
          itemBuilder: (context, index) => builder(dados[index]),
        );
      },
    );
  }

}