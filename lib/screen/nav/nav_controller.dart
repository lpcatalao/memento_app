import 'package:flutter/material.dart';
import 'package:memento_app/blocs/nav_bloc.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';
import 'package:memento_app/constants%20/memento_icons.dart';
import 'package:memento_app/screen/nav/dashboard/dashboard_screen.dart';
import 'package:memento_app/screen/nav/fab_config.dart';
import 'package:memento_app/screen/profile_screen.dart';

import 'activity/activities_screen.dart';
import 'brain_fitness/brain_fitness_screen.dart';
import 'medicine/medicine_screen.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {

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
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today_sharp),
            onPressed: () {},
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
        ],
      ),

      //TODO RETORNAR apenas o resultado
      body: Center(child: _optionScreen.elementAt(_itemSelected)),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: GeneralAppColor.black,
        type: BottomNavigationBarType.fixed,
        items: [
          createNavItem(MementoIcons.bxshomeheart, "Home"),
          createNavItem(MementoIcons.iconawesomewalking, "Atividades"),
          createNavItem(MementoIcons.iconmapdoctor, "Medicamentos"),
          createNavItem(MementoIcons.bxbrain, "Brain Fitness"),
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
          return MementoFab(visible: snapshot.data);
        },
      ),
    );
  }
}
