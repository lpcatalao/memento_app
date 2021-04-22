import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/models/activity_model.dart';
import 'package:memento_app/models/brain_fitness_model.dart';
import 'package:memento_app/models/medicine_model.dart';
import 'package:memento_app/models/task_status.dart';
import 'package:memento_app/screen/nav/dashboard/body/dashboard_body_card.dart';
import 'package:memento_app/screen/nav/dashboard/body/dashboard_body_title.dart';

class DashboardBody extends StatelessWidget {
  final double width;
  final double height;
  final BoxConstraints constraints;

  DashboardBody({this.width, this.height, this.constraints});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DashboardBodyTitle(constraints),
                middle(),
                DashboardBodyCardItem(
                    BrainFitnessCardModel(taskStatus: TaskStatus(8, 10)),
                    constraints),
                DashboardBodyCardItem(
                    ActivityCardModel(taskStatus: TaskStatus(3, 100)),
                    constraints),
                DashboardBodyCardItem(
                    MedicineCardModel(taskStatus: TaskStatus(2, 5)),
                    constraints),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget middle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 21.0),
      child: Container(
          width: constraints.maxWidth * .8,
          height: 34.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(46)),
              color: const Color(0xff292929))),
    );
  }
}
