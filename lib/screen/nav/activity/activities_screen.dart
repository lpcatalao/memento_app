import 'package:flutter/material.dart';
import 'package:memento_app/models/activity_model.dart';
import 'package:memento_app/models/task_status.dart';
import 'package:memento_app/screen/nav/option_base_screen.dart';

class ActivitiesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    List<TaskStatus> status = [];

    return Container(
      width: _size.width,
      height: _size.height,
      decoration: BoxDecoration(color: Color(0xffd5dce6)),
      child: NavOptionBaseScreen(model: ActivityCardModel()),
    );
  }
}
