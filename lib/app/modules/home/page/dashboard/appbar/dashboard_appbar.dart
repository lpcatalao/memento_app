import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/home/home_store.dart';
import 'package:memento_app/app/modules/home/page/dashboard/appbar/dashboard_appbar_list_item.dart';
import 'package:memento_app/app/modules/home/page/dashboard/appbar/dashboard_appbar_welcome_title.dart';
import 'package:memento_app/constants/general_app_constants.dart';

class DashboardAppBar extends StatelessWidget {
  final _home = Modular.get<HomeStore>();

  DateTime today = DateTime.now();
  final double width;
  final double height;

  DashboardAppBar({@required this.width, @required this.height});

  @override
  Widget build(BuildContext context) {
    var boxMaxHeight = height * .4;
    _home.fetchTodayData(today);

    return Container(
      decoration: configBoxDecoration(gradientStatus: true),
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DashboardAppBarWelcomeTitle(width),
          appBarBody(boxMaxHeight, context),
          bottomSpace(),
        ],
      ),
    );
  }

  Opacity bottomSpace() {
    return Opacity(
        opacity: .3,
        child: Container(
          width: width,
          height: height * .084,
          color: Colors.transparent,
        ));
  }

  Container appBarBody(double boxMaxHeight, BuildContext context) {
    return Container(
      width: width,
      height: boxMaxHeight,
      decoration: configBoxDecoration(gradientStatus: false),
      child: Observer(
        builder: (BuildContext context) {
          final tasks = _home.tasks.value;
          if (tasks != null) {
            return ListView.builder(
              padding: EdgeInsets.only(left: 50),
              scrollDirection: Axis.horizontal,
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final t = tasks[index];

                final date =
                    new DateTime.fromMillisecondsSinceEpoch(t.dateMilli);
                print(date);
                _home.setModel(t);
                return DashBoardAppBarItem(boxMaxHeight, _home.model, t);
              },
            );
          }
          return Center(
              child: Column(
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text("Loading...")
            ],
          ));
        },
      ),
    );
  }

  // scrollDirection: Axis.horizontal,
  // DashBoardAppBarItem(boxMaxHeight, "Item 1"),

  BoxDecoration configBoxDecoration({bool gradientStatus, Color color}) {
    return BoxDecoration(
        color: color ?? null,
        gradient: gradientStatus == false
            ? null
            : LinearGradient(
                begin: Alignment(1, 0),
                end: Alignment(0, 0.5938237309455872),
                colors: [
                    GeneralAppColor.customAppBar1,
              GeneralAppColor.customAppBar2
            ]),
        borderRadius: borderRadius(true));
  }

  Widget emptySpace() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: borderRadius(false)),
        width: width / 12,
      ),
    );
  }

  BorderRadius borderRadius(bool appBoxBorderStatus) {
    return appBoxBorderStatus == true
        ? BorderRadius.only(bottomLeft: Radius.circular(38))
        : BorderRadius.all(Radius.circular(25));
  }
}
