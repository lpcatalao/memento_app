import 'package:flutter/material.dart';

import 'atividades_screen.dart';
import 'brain_fitness_screen.dart';
import 'dashboard_screen.dart';
import 'medicamentos_screen.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _itemSelecionado = 0;

  List<Widget> _opcoesEcra = [
    DashboardScreen(),
    AtividadeScreen(),
    MedicamentoScreen(),
    BrainFitnessScreen()
  ];

  void _onItemTap(int index) {
    setState(() {
      _itemSelecionado = index;
    });
  }

  BottomNavigationBarItem createNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memento"),
      ),
      body: Center(child: _opcoesEcra.elementAt(_itemSelecionado)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          createNavItem(Icons.dashboard, "Dashboard"),
          createNavItem(Icons.fitness_center, "Atividades"),
          createNavItem(Icons.medical_services, "Medicamentos"),
          createNavItem(Icons.psychology, "Brain Fitness"),
        ],
        currentIndex: _itemSelecionado,
        onTap: _onItemTap,
      ),
    );
  }
}
