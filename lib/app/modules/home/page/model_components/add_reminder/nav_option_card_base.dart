import 'package:flutter/material.dart';
import 'package:memento_app/shared/model/task_status.dart';

abstract class ListScreenModel {
  final String title;
  final Icon icon;
  final LinearGradient gradient;
  final Color circleColor;
  final Color checkBoxSelected;
  final TaskStatus taskStatus;
  final Color defaultColor;

  ListScreenModel.name(this.title, this.icon, this.gradient, this.circleColor,
      this.checkBoxSelected, this.taskStatus, this.defaultColor);
}
