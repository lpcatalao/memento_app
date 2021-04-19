import 'package:flutter/material.dart';

abstract class NavOptionCardBase {
  final String title;
  final double porcentage;
  final Icon icon;
  final LinearGradient gradient;
  final int total;
  final int completed;
  final Color circleColor;

  NavOptionCardBase.name(this.title, this.porcentage, this.icon, this.gradient,
      this.total, this.completed, this.circleColor);


}
