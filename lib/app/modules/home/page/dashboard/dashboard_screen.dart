import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/dashboard/appbar/dashboard_appbar.dart';
import 'package:memento_app/app/modules/home/page/dashboard/body/dashboard_body.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/utilities/screen_util.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = ScreenSizeUtil(context);

    return Container(
      color: GeneralAppColor.appBackgroundGray,
      width: _size.width,
      height: _size.height,
      child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final sixtyPercentHight =
            height * .5; //50% height of the screen for the body
        final fortyPercentHight = height * .5; //50% height of the screen
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
