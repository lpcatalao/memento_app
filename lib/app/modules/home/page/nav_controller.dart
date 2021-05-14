import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memento_app/app/modules/home/page/dashboard/dashboard_screen.dart';
import 'package:memento_app/app/modules/home/page/nav_fab_config.dart';
import 'package:memento_app/app/modules/profile/page/user/profile_screen.dart';
import 'package:memento_app/blocs/nav_bloc.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/constants/memento_icons.dart';

import 'activity/activities_screen.dart';
import 'brain_fitness/brain_fitness_screen.dart';
import 'medicine/medicine_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _navBloc = NavBloc();

  //TODO EXTRAIR mudar para arquitetura BLoC
  int _itemSelected = 0;

  List<Widget> _optionScreen = [
    DashboardScreen(),
    ActivityScreen(),
    MedicineScreen(),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              MementoIcons.bxbrain,
              color:
                  _itemSelected == 0 ? GeneralAppColor.softBlack : Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            Text("MEMENTO",
                style: TextStyle(
                    color: _itemSelected == 0
                        ? GeneralAppColor.softBlack
                        : Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.left),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.calendarAlt),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.user),
            onPressed: () {
             Modular.to.pushNamed('/profile/user');
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
