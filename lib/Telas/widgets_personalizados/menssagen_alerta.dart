import 'package:flutter/material.dart';

class MensagemAlerta extends StatelessWidget {
  final String texto;

  const MensagemAlerta(this.texto);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Erro"),
      content: Text(texto),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    );
  }
}
