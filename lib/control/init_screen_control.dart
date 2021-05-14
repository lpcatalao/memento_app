import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/nav_controller.dart';
import 'package:memento_app/repository/onboard_repository.dart';
import 'package:memento_app/screen/onboard/onboarding_screen.dart';

class FutureController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      initialData: false,
      future: getSharedPref(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return buildWaitingScreen();
            break;
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            return buildingDoneScreen(snapshot);
            break;
        }
        return null;
      },
    );
  }
}

//TODO fazer essa chamada por meio da arquitetura BLoC

Widget buildingDoneScreen(AsyncSnapshot<bool> snapshot) {
  if (snapshot.data) {
    setSharedPref(false);
    return Home();
  }

  return OnboardingScreen();
}

Scaffold buildWaitingScreen() {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text('Loading...'),
        ],
      ),
    ),
  );
}
