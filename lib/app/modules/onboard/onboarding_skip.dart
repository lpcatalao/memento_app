import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/start_screen.dart';
import 'package:memento_app/shared/repository/onboard_repository.dart';

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
              builder: (context) => StartScreen(),
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
