import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/onboarding/onboarding_store.dart';

class OnboardingAnimatedDot extends StatelessWidget {
  final int _numPages = 3;
  final _onboarding = Modular.get<OnboardingStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _pageIndicator(_numPages, _onboarding.page),
        );
      }),
    );
  }
}

List<Widget> _pageIndicator(int numPages, int currentPage) {
  List<Widget> list = [];

  for (int i = 0; i < numPages; i++) {
    list.add(i == currentPage ? _indicator(true) : _indicator(false));
  }
  return list;
}

Widget _indicator(bool isActive) {
  return AnimatedContainer(
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    height: 8.0,
    width: isActive ? 24.0 : 10.0,
    decoration: BoxDecoration(
        color: isActive ? Colors.teal : Color(0xFF70CBBF),
        borderRadius: BorderRadius.all(Radius.circular(12))),
    duration: Duration(milliseconds: 200),
  );
}
