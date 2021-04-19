import 'package:flutter/material.dart';
import 'package:memento_app/blocs/nav_bloc.dart';
import 'package:memento_app/screen/add_activity_screen.dart';
import 'package:memento_app/screen/profile_screen.dart';

import 'atividades_screen.dart';
import 'brain_fitness_screen.dart';
import 'dashboard_screen.dart';
import 'medicamentos_screen.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  var variavel;
  final _navBloc = NavBloc();

  //TODO EXTRAIR mudar para arquitetura BLoC
  int _itemSelected = 0;

  List<Widget> _optionScreen = [
    DashboardScreen(),
    ActivitiesScreen(),
    MedicalScreen(),
    BrainFitnessScreen()
  ];

  //TODO EXTRAIR mudar para arquitetura BLoC
  void _onItemTap(int index) {
    setState(() {
      _itemSelected = index;
    });
  }

  BottomNavigationBarItem createNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  @override
  void dispose() {
    _navBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memento"),
        centerTitle: true,
        actions: [
          // IconButton(
          //   icon: Icon(Icons.calendar_today_sharp),
          //   onPressed: () {},
          // ),
          SizedBox(
            width: 15,
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProfileScreen()));
            },
          ),
          SizedBox(width: 10)
        ],
      ),

      //TODO RETORNAR apenas o resultado
      body: Center(child: _optionScreen.elementAt(_itemSelected)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          createNavItem(Icons.dashboard, "Dashboard"),
          createNavItem(Icons.fitness_center, "Atividades"),
          createNavItem(Icons.medical_services, "Medicamentos"),
          createNavItem(Icons.psychology, "Brain Fitness"),
        ],
        currentIndex: _itemSelected,
        onTap: (value) {
          _onItemTap(value);
          _navBloc.eventSink.add(value);
        },
      ),

      floatingActionButton: StreamBuilder(
        initialData: false,
        stream: _navBloc.stateStream,
        builder: (context, snapshot) {
          return Visibility(
            visible: snapshot.data,
            child: FloatingActionButton(
              child: Icon(
                Icons.add,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AddActivityScreen()));
              },
            ),
          );
        },
      ),
    );
  }
}
