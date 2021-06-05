import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/onboarding/onboarding_store.dart';
import 'package:memento_app/app/modules/onboarding/page/onboarding_animated_dot.dart';
import 'package:memento_app/app/modules/onboarding/page/onboarding_bottom_button.dart';
import 'package:memento_app/app/modules/onboarding/page/onboarding_pageview.dart';
import 'package:memento_app/app/modules/onboarding/page/onboarding_skip.dart';

class OnboardingPage extends StatelessWidget {
  final _onboarding = Modular.get<OnboardingStore>();

  @override
  Widget build(BuildContext context) {
    _onboarding.fetchSharedPreferences();

    return Scaffold(
      body: Container(
        decoration: _backgroundConfig(),
        child: _bodyContent(),
      ),
    );
  }

  //Configuração do plano de fundo
  BoxDecoration _backgroundConfig() => BoxDecoration(
        color: Color(0xfff6f6f7),
      );

  Widget _bodyContent() {
    final PageController _pageController = PageController(initialPage: 0);

    return SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OnboardingSkipButton(),
            OnboardingPageView(_pageController),
            OnboardingAnimatedDot(),
            OnboardingBottomButton(_pageController)
          ],
        ));
  }
}
