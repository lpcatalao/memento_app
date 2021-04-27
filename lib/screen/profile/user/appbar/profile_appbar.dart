import 'package:flutter/material.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/screen/profile/user/appbar/profile_appbar_bottom.dart';
import 'package:memento_app/screen/profile/user/appbar/profile_appbar_photo.dart';
import 'package:memento_app/screen/profile/user/appbar/profile_appbar_welcome_title.dart';

class ProfileAppBar extends StatelessWidget {
  final double width;
  final double height;

  ProfileAppBar(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: configBoxDecoration(gradientStatus: true),
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ProfileAppBarWelcomeTitle(width, height),
          SizedBox(
            height: height * .03,
          ),
          ProfileAppbarPhoto(width, height),
          SizedBox(
            height: height * .03,
          ),
          ProfileAppBarBottom(width, height),
          SizedBox(
            height: height * .05,
          ),
        ],
      ),
    );
  }

  BoxDecoration configBoxDecoration({bool gradientStatus, Color color}) {
    return BoxDecoration(
        color: color ?? null,
        gradient: gradientStatus == false
            ? null
            : LinearGradient(
                begin: Alignment(1, 0),
                end: Alignment(0, 0.5938237309455872),
                colors: [
                    GeneralAppColor.customAppBar1,
                    GeneralAppColor.customAppBar2
                  ]),
        borderRadius: borderRadius(true));
  }

  BorderRadius borderRadius(bool appBoxBorderStatus) {
    return appBoxBorderStatus == true
        ? BorderRadius.only(bottomLeft: Radius.circular(38))
        : BorderRadius.all(Radius.circular(25));
  }
}
