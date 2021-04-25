import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';
import 'package:memento_app/screen/nav/profile/appbar/profile_appbar.dart';
import 'package:memento_app/screen/nav/profile/appbar/profile_appbar_config.dart';
import 'package:memento_app/screen/nav/profile/profile_body.dart';
import 'package:memento_app/screen/nav/profile/profile_bottom.dart';
import 'package:memento_app/screen/register_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ProfileAppBarTitleConfig(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: GeneralAppColor.bottomProfileColor2,
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Column(
                children: [
                  ProfileAppBar(
                      constraints.maxWidth, constraints.maxHeight * .6),
                  ProfileBody(constraints.maxWidth, constraints.maxHeight),
                  ProfileBottom(constraints.maxWidth, constraints.maxHeight)
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  Container buildBottomButton(
      BuildContext context, BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth,
      height: constraints.maxHeight * .1,
      decoration: BoxDecoration(color: Colors.blue),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => RegisterScreen()));
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Center(
            child: Text(
              'Adicionar Cuidador(a)',
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
