import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_option_card_base.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/constants/memento_icons.dart';
import 'package:memento_app/shared/model/task_status.dart';

class BrainFitnessListWidget extends ListScreenModel {
  static const String _TITLE = 'Brain Fitness';
  static const Icon _ICON = const Icon(MementoIcons.bxbrain);
  static const LinearGradient _GRADIENT = const LinearGradient(
      begin: Alignment(0, 0.5),
      end: Alignment(1, 0.5),
      colors: [GeneralAppColor.brainBar1, GeneralAppColor.brainBar2]);
  static const Color _CIRCLE_COLOR = GeneralAppColor.brainCircle;
  static const Color _CHECK_BOX_COLOR = Color(0xFFCBB700);

  BrainFitnessListWidget({TaskStatus taskStatus})
      : super.name(_TITLE, _ICON, _GRADIENT, _CIRCLE_COLOR, _CHECK_BOX_COLOR,
            taskStatus);
}
