import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/models/activity_model.dart';
import 'package:memento_app/models/brain_fitness_model.dart';
import 'package:memento_app/models/medicine_model.dart';
import 'package:memento_app/models/nav_option_card_base.dart';
import 'package:memento_app/models/task_status.dart';

class DashboardBody extends StatelessWidget {
  final double width;
  final double height;
  final BoxConstraints constraints;

  DashboardBody({this.width, this.height, this.constraints});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: width,
      height: height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 32.0, right: 32.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Consulte seus objetivos',
                    style: TextStyle(
                        color: Color(0xff482700),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'A sua rotina vai ajudar a manter sua memoria viva',
                    style: TextStyle(color: Color(0xff171717), fontSize: 16),
                  ),
                ],
              ),
            ),

            // Rectangle 1546
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                  width: constraints.maxWidth * .8,
                  height: 34.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(46)),
                      color: const Color(0xff292929))),
            ),
            buildDashboardCard(
                constraints, BrainFitnessCardModel(taskStatus: TaskStatus(3, 10))),
            buildDashboardCard(
                constraints, ActivityCardModel(taskStatus: TaskStatus(3, 10))),
            buildDashboardCard(
                constraints, MedicineCardModel(taskStatus: TaskStatus(3, 10))),
          ],
        ),
      ),
    );
  }

  Widget buildDashboardCard(
      BoxConstraints constraints, NavOptionCardBase navOption) {
    TaskStatus status = navOption.taskStatus;

    final height = 79.0.h;
    final width = constraints.maxWidth;
    final cardWidth = width - 8;
    final progressBarMaxWidth = cardWidth * .73;
    final taskRemaing = checkDivision(status.completed, status.total);

    return Container(
      height: height,
      child: Card(
        child: Row(
          children: [
            Container(
              height: height,
              width: cardWidth * .20,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                          color: navOption.circleColor)),
                  navOption.icon,
                ],
              ),
            ),
            Container(
              height: height,
              width: cardWidth * .8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 20.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(navOption.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.sp)),
                        Text('${status.completed}/${status.total}'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x0bffffff),
                                offset: Offset(0, 1),
                                blurRadius: 0,
                                spreadRadius: 0)
                          ],
                          color: const Color(0xffeaeaea)),
                      height: 8.h,
                      width: progressBarMaxWidth,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                gradient: navOption.gradient,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: 8.h,
                            width: taskRemaing == 0
                                ? 0
                                : progressBarMaxWidth / taskRemaing,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double checkDivision(int completed, int total) {
    var division = total / completed;
    if (division.toString() == double.nan.toString()) {
      return 0;
    }

    return division;
  }
}
