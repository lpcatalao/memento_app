import 'package:memento_app/constants%20/general_app_constants.dart';
import 'package:memento_app/constants%20/memento_icons.dart';
import 'package:memento_app/models/nav_option_card_base.dart';
import 'package:flutter/material.dart';
import 'package:memento_app/models/task_status.dart';

class BrainFitnessCardModel extends NavOptionCardBase {
  static const String _TITLE = 'Brain Fitness';
  static const Icon _ICON = const Icon(MementoIcons.bxbrain);
  static const LinearGradient _GRADIENT = const LinearGradient(
      begin: Alignment(0, 0.5),
      end: Alignment(1, 0.5),
      colors: [GeneralAppColor.brainBar1, GeneralAppColor.brainBar2]);
  static const Color _CIRCLE_COLOR = GeneralAppColor.brainCircle;
  static const Color _CHECK_BOX_COLOR = Color(0xFFCBB700);

  BrainFitnessCardModel({TaskStatus taskStatus})
      : super.name(_TITLE, _ICON, _GRADIENT, _CIRCLE_COLOR, _CHECK_BOX_COLOR,
            taskStatus);
}
