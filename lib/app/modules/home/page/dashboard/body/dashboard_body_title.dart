import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/constants/general_app_constants.dart';

class DashboardBodyTitleWidget extends StatelessWidget {
  final _width;
  final _height;
  static const _TITLE = 'Consulte seus objetivos';
  static const _SUBTITLE = 'A sua rotina vai ajudar a manter sua memoria viva';

  DashboardBodyTitleWidget(this._width, this._height);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: _height * .01, top: _height * .03),
      child: Container(
        width: _width * .88,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text(
                  _TITLE,
                  style: TextStyle(
                      color: GeneralAppColor.dashboardTitleBrown,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _SUBTITLE,
                style: TextStyle(color: Color(0xff171717), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
