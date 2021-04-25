import 'package:flutter/material.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';
import 'package:memento_app/constants%20/memento_icons.dart';

class ProfileAppBarTitleConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          MementoIcons.bxbrain,
          color: GeneralAppColor.softBlack,
        ),
        SizedBox(
          width: 15,
        ),
        Text("MEMENTO",
            style: TextStyle(
                color: GeneralAppColor.softBlack,
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
            textAlign: TextAlign.left),
      ],
    );
  }
}
