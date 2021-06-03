import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memento_app/app/modules/profile/page/add_profile_appbar_model.dart';
import 'package:memento_app/constants/general_app_constants.dart';

class CalendarAppbarWidget extends ProfileAppbarModel {
  CalendarAppbarWidget(double width, double height)
      : super(width, height, "CALENDÁRIO", FontAwesomeIcons.calendarAlt,
            GeneralAppColor.appBackgroundGray);
}
