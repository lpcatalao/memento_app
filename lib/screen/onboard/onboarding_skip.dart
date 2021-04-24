import 'package:flutter/material.dart';
import 'package:memento_app/repository/onboard_repository.dart';
import 'package:memento_app/screen/nav/nav_controller.dart';

class OnboardingSkipButton extends StatefulWidget {
  @override
  _OnboardingSkipButtonState createState() => _OnboardingSkipButtonState();
}

class _OnboardingSkipButtonState extends State<OnboardingSkipButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Nav(),
            ),
          );

          //TODO mudar isso para ficar no padrão de arquitetura BLoC
          setState(() {
            setSharedPref(true);
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Ok, Percebo",
              style: TextStyle(color: Colors.teal, fontSize: 20.0),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.teal,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
