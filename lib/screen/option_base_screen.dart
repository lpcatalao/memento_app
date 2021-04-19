import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/blocs/nav_bloc.dart';
import 'package:memento_app/repository/nav_screen_state_repository.dart';
import 'package:memento_app/screen/add_activity_screen.dart';

class OptionBaseScreen extends StatefulWidget {
  final String title;

  OptionBaseScreen({this.title});

  @override
  _OptionBaseScreenState createState() => _OptionBaseScreenState();
}

class _OptionBaseScreenState extends State<OptionBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            width: constraints.maxWidth,
            height: constraints.maxHeight * .3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: constraints.maxWidth * .8,
                  height: (constraints.maxHeight * .3) * .2,
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.yellow),
            width: constraints.maxWidth,
            height: constraints.maxHeight * .65,
            child: ListView(
              children: [
                itemList(1, Colors.white),
                itemList(2, Colors.red),
                itemList(3, Colors.blue),
                itemList(4, Colors.greenAccent),
                itemList(5, Colors.pink),
              ],
            ),
          )
        ],
      );
    });
  }

  Container itemList(int index, Color color) {
    return Container(
      height: 100,
      color: color,
      child: Text('Conteudo ${index}'),
    );
  }
}
