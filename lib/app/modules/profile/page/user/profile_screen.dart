import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_profile.dart';
import 'package:memento_app/app/modules/profile/page/user/appbar/profile_appbar.dart';
import 'package:memento_app/app/modules/profile/page/user/appbar/profile_appbar_config.dart';
import 'package:memento_app/app/modules/profile/page/user/body/profile_body.dart';
import 'package:memento_app/app/modules/profile/page/user/bottom/profile_bottom.dart';
import 'package:memento_app/app/modules/profile/page/user/profile_fab.dart';
import 'package:memento_app/constants/general_app_constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ProfileAppBarTitleConfig(),
        actions: [
          IconButton(
              onPressed: () {
                Modular.to.navigate('/profile/user/map');
              },
              icon: Icon(Icons.map_outlined))
        ],
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
      floatingActionButton: ProfileFab(),
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
                  builder: (BuildContext context) => AddUserProfile()));
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
