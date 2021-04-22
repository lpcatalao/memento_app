import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';

//TODO Arrumar uma forma de remover um o constrainsts
class DashboardBodyTitle extends StatelessWidget {
  final constraints;
  static const _TITLE = 'Consulte seus objetivos';
  static const _SUBTITLE = 'A sua rotina vai ajudar a manter sua memoria viva';

  DashboardBodyTitle(this.constraints);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 21.0.w, top: 33.h),
      child: Container(
        width: constraints.maxWidth * .88,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _TITLE,
                style: TextStyle(
                    color: GeneralAppColor.dashboardTitleBrown,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _SUBTITLE,
                style: TextStyle(color: Color(0xff171717), fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
