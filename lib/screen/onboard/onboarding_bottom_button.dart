import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:memento_app/blocs/onboarding_bloc.dart';
import 'package:memento_app/screen/profile/add_user/add_user_profile.dart';
import 'package:provider/provider.dart';

class OnboardingBottomButton extends StatelessWidget {
  final int _numPages = 3;
  final PageController _pageController;

  OnboardingBottomButton(this._pageController);

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<OnboardingBloc>(context);

    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .1,
        child: StreamBuilder(
            stream: _bloc.stateStream,
            builder: (context, snapshot) {
              return snapshot.data != _numPages - 1
                  ? _buildBottomButtom(
                      () {
                        return _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      'Avançar',
                      Colors.transparent,
                    )
                  : _buildBottomButtom(
                      () {
                        return Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddUserProfile()));
                      },
                      'Criar Perfil',
                      Colors.teal,
                    );
            }),
      ),
    );
  }

  Widget _buildBottomButtom(
      Future<void> Function() buttonAction, String text, Color color) {
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
