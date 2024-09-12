import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/onboarding/onboarding_store.dart';

class OnboardingBottomButton extends StatelessWidget {
  final int _numPages = 3;
  final PageController _pageController;
  final _onboarding = Modular.get<OnboardingStore>();

  OnboardingBottomButton(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Observer(builder: (snapshot) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .1,
          child: _onboarding.page < 2
              ? Container(
                  color: Color(0xfff6f6f7),
                )
              : _buildBottomButtom(
                  () {
                    Modular.to
                        .pushReplacementNamed('/home/profile/user/new_user');
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => AddUserProfilePage()));
                  },
                  'Criar Perfil',
                  Colors.teal,
                ),
        );
      }),
    );
  }

  Widget _buildBottomButtom(Function() buttonAction, String text, Color color) {
    return GestureDetector(
      onTap: buttonAction,
      child: Container(
        decoration: BoxDecoration(color: color),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
