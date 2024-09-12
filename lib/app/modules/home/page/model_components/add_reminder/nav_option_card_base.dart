import 'package:flutter/material.dart';

enum TaskModelType { ACTIVITY, MEDICINE, BRAIN_FITNESS }

abstract class ListScreenModel {
  final String title;
  final Icon icon;
  final LinearGradient gradient;
  final Color circleColor;
  final Color checkBoxSelected;
  final Color defaultColor;
  final TaskModelType type;

  ListScreenModel.name(this.title, this.icon, this.gradient, this.circleColor,
      this.checkBoxSelected, this.defaultColor, this.type);
}
