import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_dialog.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_profile_body_form.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_profile_fab.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_profile_mid.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_profile_top.dart';
import 'package:memento_app/constants/general_app_constants.dart';

class AddUserProfile extends StatefulWidget {
  @override
  _AddUserProfileState createState() => _AddUserProfileState();
}

class _AddUserProfileState extends State<AddUserProfile> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
          context: context,
          builder: (context) {
            return AddUserAlertDialog();
          });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    final width = _size.width;
    final height = _size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: GeneralAppColor.appBackgroundGray,
        child: Column(
          children: [
            AddUserProfileTop(width, height),
            AddUserProfileMid(width, height),
            AddUserProfileBodyForm(width, height)
          ],
        ),
      ),
      floatingActionButton: AddUserProfileFab(),
    );
  }
}
