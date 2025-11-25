  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/oficina.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/tela_detalhes_clientes.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/tela_detalhes_oficina.dart';
import 'package:sistema_mecaniaca_inteligente/utils/widgets/nav.dart';

  class WidgetListar extends StatelessWidget {
    var dados;
    WidgetListar(this.dados);

    @override
    Widget build(BuildContext context) {
      return InkWell(
        onTap: (){
          if(dados is Oficina){
              push(context, TelaDetalhesOficna(dados));
          }else{
              push(context, TelaDetalhesClientes(dados));
          }
        },
        child: Container(
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
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[300],
                backgroundImage: dados.foto!.isNotEmpty
                    ? NetworkImage(dados.foto!)
                    : null,
                child: dados.foto!.isEmpty
                    ? Icon(Icons.person, size: 45)
                    : null,
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dados.nome,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Icon(Icons.phone, size: 14, color: Colors.black87),
                        SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            dados.telefone,
                            style: TextStyle(fontSize: 13),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Icon(dados is Oficina ? Icons.location_on :
                        Icons.info_outline
                            , size: 16
                            , color: Colors.black87),
                        SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            dados is Oficina ?
                            dados.endereco : dados.cpf,
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
