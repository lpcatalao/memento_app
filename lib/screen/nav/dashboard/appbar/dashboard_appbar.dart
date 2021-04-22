import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';
import 'package:memento_app/screen/nav/dashboard/appbar/dashboard_appbar_list_item.dart';
import 'package:memento_app/screen/nav/dashboard/appbar/dashboard_appbar_welcome_title.dart';


//TODO REMOVER appBarBody() PARA DashboardAppBarList
class DashboardAppBar extends StatelessWidget {
  final double width;
  final double height;

  DashboardAppBar({@required this.width, @required this.height});

  @override
  Widget build(BuildContext context) {
    var boxMaxHeight = height * .4;

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
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          emptySpace(),
          DashBoardAppBarItem(boxMaxHeight, "Pagar conta da baby sugar"),
          DashBoardAppBarItem(boxMaxHeight, "Jogar dominó"),
          DashBoardAppBarItem(boxMaxHeight, "Dar um mortal"),
          DashBoardAppBarItem(boxMaxHeight, "Brincar de roleta russa"),
        ],
      ),
    );
  }

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
