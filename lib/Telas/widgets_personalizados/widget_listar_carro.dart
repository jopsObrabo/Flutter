import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/tela_detalhes_carro.dart';
import 'package:sistema_mecaniaca_inteligente/utils/widgets/nav.dart';

class WidgetListarCarro extends StatelessWidget {
Carro dados;
WidgetListarCarro(this.dados);

@override
Widget build(BuildContext context) {
  return InkWell(
    onTap: (){
      push(context, TelaDetalhesCarro(imagePath:dados.banner!,dados: dados ));
    },
    child:  Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE6E6E6),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [

          Container(
            width: 150,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: dados.banner!.isNotEmpty
                  ? Image.network(
                dados.banner!,
                fit: BoxFit.fill,
              )
                  :  Icon(Icons.image, size: 40),
            ),
          ),
          SizedBox(width: 30,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.directions_car_filled, size: 14, color: Colors.black87),
                    SizedBox(width: 4),
                    Text(
                      dados.marca,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Icon(Icons.car_repair, size: 14, color: Colors.black87),
                    SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        dados.modelo,
                        style: TextStyle(fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        dados.ano,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}