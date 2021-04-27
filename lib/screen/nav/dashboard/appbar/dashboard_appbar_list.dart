import 'package:flutter/material.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/screen/nav/dashboard/appbar/dashboard_appbar_list_item.dart';


//TODO REFACTOR
class DashboardAppBarList extends StatelessWidget {
  final double height;
  final double width;

  DashboardAppBarList(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: configBoxDecoration(gradientStatus: false),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          emptySpace(),
          DashBoardAppBarItem(height, "Lista 1"),
          DashBoardAppBarItem(height, "Lista 2"),
          DashBoardAppBarItem(height, "Lista 3"),
          DashBoardAppBarItem(height, "Lista 4"),
        ],
      ),
    );
    
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
}


