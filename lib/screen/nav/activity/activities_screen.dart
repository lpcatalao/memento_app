import 'package:flutter/material.dart';
import 'package:memento_app/models/activity_model.dart';
import 'package:memento_app/models/task_status.dart';
import 'package:memento_app/screen/nav/nav_content_layout.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    List<TaskStatus> status = [];

    return Container(
      width: _size.width,
      height: _size.height,
      decoration: BoxDecoration(color: Color(0xffd5dce6)),
      child: NavContentLayout(model: ActivityCardModel(taskStatus: TaskStatus(3, 100))),
    );
  }
}
