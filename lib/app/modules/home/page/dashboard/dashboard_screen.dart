import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/dashboard/appbar/dashboard_appbar.dart';
import 'package:memento_app/app/modules/home/page/dashboard/body/dashboard_body.dart';
import 'package:memento_app/constants/general_app_constants.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final width = _size.width;
    final height = _size.height;
    double percentage = 0;

    if (height < 700) {
      percentage = .45;
    } else {
      percentage = .5;
    }

    final fortyPercentHight = height * .5; //50% height of the screen
    final sixtyPercentHight =
        height * percentage; //50% height of the screen for the body

    return Container(
      color: GeneralAppColor.appBackgroundGray,
      width: _size.width,
      height: _size.height,
      child: Column(
        children: [
          DashboardAppBar(width: width, height: fortyPercentHight),
          DashboardBodyWidget(
            width: width,
            height: sixtyPercentHight,
          )
        ],
      ),
    );
  }
}
