import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/onboarding/onboarding_store.dart';
import 'package:memento_app/app/modules/onboarding/page/page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController _pageController;
  final _onboarding = Modular.get<OnboardingStore>();

  OnboardingPageView(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * .6,
      child: PageView(
        physics: ClampingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (page) {
          _onboarding.setPage(page);
        },
        children: [
          PageViewItem(
              image: 'images/intro1.png',
              title: 'Queremos ajudar no seu dia a dia',
              text:
                  'Pode definir objectivos diários e a app vai enviar notificações para que não deixe nada por fazer.'),
          PageViewItem(
              image: 'images/intro2.png',
              title: "O teu assistente pessoal de memória",
              text:
                  "Temos exercícios tarefas, para lhe propor que o vão ajudar a melhorar a sua memória."),
          PageViewItem(
              image: 'images/intro3.png',
              title: "Crie o seu perfil para iniciar",
              text: 'Explicação')
        ],
      ),
    );
  }
}
