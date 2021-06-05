import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          Modular.to.pushReplacementNamed('/home/start');
          // Modular.navigatorDelegate;
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => StartPage(),
          //   ),
          // );
          // setState(() {
          //   setSharedPref(true);
          // });
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
