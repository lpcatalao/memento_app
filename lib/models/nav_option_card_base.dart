import 'package:flutter/material.dart';
import 'package:memento_app/models/task_status.dart';

abstract class NavOptionCardBase {
  final String title;
  final Icon icon;
  final LinearGradient gradient;
  final Color circleColor;
  final Color checkBoxSelected;
  final TaskStatus taskStatus;

  NavOptionCardBase.name(this.title, this.icon, this.gradient, this.circleColor,
      this.checkBoxSelected, this.taskStatus);
}
