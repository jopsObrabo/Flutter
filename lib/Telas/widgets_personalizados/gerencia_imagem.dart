
import 'package:flutter/material.dart';

class GererciaImagem {
  Future<void> pegarLinkImagem(
      BuildContext context,
      TextEditingController controller,
      ) async {
    TextEditingController temp = TextEditingController(text: controller.text);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Inserir link da imagem'),
          content: TextField(
            controller: temp,
            decoration: InputDecoration(
              hintText: 'Cole aqui a URL da imagem',
            ),
          ),
          actions: [

            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancelar")),
            TextButton(
              onPressed: () {
                controller.text = temp.text.trim();
                Navigator.pop(context);
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}