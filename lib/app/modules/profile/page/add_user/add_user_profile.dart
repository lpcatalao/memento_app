import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/onboarding/onboarding_store.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_dialog.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_profile_body_form.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_profile_fab.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_profile_mid.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_profile_top.dart';
import 'package:memento_app/constants/general_app_constants.dart';

class AddUserProfilePage extends StatefulWidget {
  final _onboarding = Modular.get<OnboardingStore>();

  @override
  _AddUserProfilePageState createState() {
    return _AddUserProfilePageState();
  }
}

class _AddUserProfilePageState extends State<AddUserProfilePage> {
  @override
  void initState() {
    if (!widget._onboarding.registerAlert) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        showDialog(
            context: context,
            builder: (context) {
              return AddUserAlertDialog();
            });
      });
    }
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
