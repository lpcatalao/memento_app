import 'package:flutter/src/widgets/icon_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memento_app/app/modules/profile/page/add_profile_appbar_model.dart';

class AddCaretakerScreenAppBar extends ProfileAppbarModel {
  AddCaretakerScreenAppBar(
      double width, double height)
      : super(width, height, "NOVO\nCUIDADOR", FontAwesomeIcons.userNurse);
}
