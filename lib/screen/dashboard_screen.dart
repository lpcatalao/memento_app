import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/models/activity_model.dart';
import 'package:memento_app/models/brain_fitness_model.dart';
import 'package:memento_app/models/medicine_model.dart';
import 'package:memento_app/models/nav_option_base.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    final _size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xffd5dce6),
      width: _size.width,
      height: _size.height,
      child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        return Column(
          children: [
            buildAppBar(width, height * .4),
            buildBody(width, height * .6, constraints)
          ],
        );
      }),
    );
  }

  Container buildBody(double width, double height, BoxConstraints constraints) {
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
                constraints, BrainFitnessModel(total: 10, completed: 5)),
            buildDashboardCard(
                constraints, ActivityModel(total: 12, completed: 3)),
            buildDashboardCard(
                constraints, MedicineModel(total: 3, completed: 1)),
          ],
        ),
      ),
    );
  }

  Container buildAppBar(double width, double height) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(1, 0),
              end: Alignment(0, 0.5938237309455872),
              colors: [const Color(0xff1791be), const Color(0xff15d99d)]),
          color: Colors.black,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15))),
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.transparent,
              width: width * .8,
              height: height / 2.5,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá José',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Bem vindo, você já olhou as suas fotos antigas hoje?',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              height: height / 3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  horizontalList(1, Colors.white),
                  horizontalList(2, Colors.white),
                  horizontalList(3, Colors.white),
                  horizontalList(4, Colors.white),
                  horizontalList(5, Colors.white),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding horizontalList(int index, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(12))),
        width: 130,
        child: Text('Conteudo ${index}'),
      ),
    );
  }

  Widget buildDashboardCard(
      BoxConstraints constraints, NavOptionCardBase navOption) {
    final height = 79.0.h;
    final width = constraints.maxWidth;
    final cardWidth = width - 8;
    final progressBarMaxWidth = cardWidth * .73;
    final taskRemaing = checkDivision(navOption.completed, navOption.total);

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
                        Text('${navOption.completed}/${navOption.total}'),
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
