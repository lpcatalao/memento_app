import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memento_app/app/modules/home/home_store.dart';
import 'package:memento_app/app/modules/home/page/dashboard/dashboard_screen.dart';
import 'package:memento_app/app/modules/home/page/start_fab_widget.dart';
import 'package:memento_app/app/modules/home/page/submodules/reminder_store.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/constants/memento_icons.dart';

import 'activity/activities_screen.dart';
import 'brain_fitness/brain_fitness_screen.dart';
import 'medicine/medicine_screen.dart';

class StartPage extends StatefulWidget {
  final _home = Modular.get<HomeStore>();
  final _reminder = Modular.get<ReminderStore>();

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ModularState<StartPage, HomeStore> {
  List<Widget> _optionScreen = [
    DashboardScreen(),
    ActivityScreen(),
    MedicineScreen(),
    BrainFitnessScreen()
  ];

  @override
  void initState() {
    widget._reminder.initNotificationSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget._home.findTaskStatus();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: Observer(
        builder: (context) {
          return Center(child: _optionScreen.elementAt(store.itemSelected));
        },
      ),
      bottomNavigationBar: Observer(
        builder: (BuildContext context) {
          return BottomNavigationBar(
            selectedItemColor: GeneralAppColor.black,
            type: BottomNavigationBarType.fixed,
            items: [
              createNavItem(MementoIcons.bxshomeheart, "Home"),
              createNavItem(MementoIcons.iconawesomewalking, "Atividades"),
              createNavItem(MementoIcons.iconmapdoctor, "Medicamentos"),
              createNavItem(MementoIcons.bxbrain, "Brain Fitness"),
            ],
            currentIndex: store.itemSelected,
            onTap: (value) {
              store.setItemSelected(value);
            },
          );
        },
      ),
      floatingActionButton: Observer(
        builder: (context) {
          return StartFabWidget(
            visible: store.isFabVisible,
            page: store.itemSelected,
            color: store.changeColor,
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        children: [
          Observer(
            builder: (BuildContext context) {
              return Icon(
                MementoIcons.bxbrain,
                color: store.itemSelected == 0
                    ? GeneralAppColor.softBlack
                    : Colors.white,
              );
            },
          ),
          SizedBox(
            width: 15,
          ),
          Observer(
            builder: (BuildContext context) {
              return Text("MEMENTO",
                  style: TextStyle(
                      color: store.itemSelected == 0
                          ? GeneralAppColor.softBlack
                          : Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                  textAlign: TextAlign.left);
            },
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(FontAwesomeIcons.calendarAlt),
          onPressed: () {
            Modular.to.pushNamed('/home/calendar');
          },
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.user),
          onPressed: () {
            Modular.to.pushNamed('/home/profile/user');
          },
        ),
      ],
    );
  }

  BottomNavigationBarItem createNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
