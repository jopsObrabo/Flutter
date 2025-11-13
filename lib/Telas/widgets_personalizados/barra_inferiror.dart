
import 'package:flutter/material.dart';

class BarraInferior extends StatefulWidget {
  const BarraInferior({super.key});

  @override
  State<BarraInferior> createState() => _BarraInfeiriorState();

}

class _BarraInfeiriorState extends State<BarraInferior>{
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _indiceAtual,
      onTap: (index) {
        setState(() {
          _indiceAtual = index;
        });
      },
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home, color: Colors.red),
          label: "início",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.car_repair_outlined),
          activeIcon: Icon(Icons.car_repair, color: Colors.red),
          label: "carros",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person, color: Colors.red),
          label: "meu perfil",
        ),
      ],
    );
  }

}