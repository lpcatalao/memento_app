import 'package:flutter/material.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';
import 'package:memento_app/models/task_status.dart';
import 'package:memento_app/screen/nav/dashboard/dashboard_screen_appbar.dart';
import 'package:memento_app/screen/nav/dashboard/dashboard_screen_body.dart';
import 'package:memento_app/utilities/screen_util.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = ScreenSize(context);

    return Container(
      color: GeneralAppColor.appBackgroundGray,
      width: _size.width,
      height: _size.height,
      child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final sixtyPercentHight = height * .6; //60% width of the screen
        final fortyPercentHight = height * .4; //40% width of the screen
        return Column(
          children: [
            DashboardAppBar(width: width, height: fortyPercentHight),
            DashboardBody(
              width: width,
              height: sixtyPercentHight,
              constraints: constraints,
            )
          ],
        );
      }),
    );
  }
}
