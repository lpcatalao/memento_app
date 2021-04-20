import 'package:flutter/material.dart';
import 'package:memento_app/repository/onboard_repository.dart';

import '../nav/nav_controller.dart';
import '../register_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final _numPages = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: _backgroundConfig(),
          child: _bodyContent(),
        ),
        bottomSheet: _bottomCreateProfile());
  }

  Padding _bodyContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _skipButton(),
          _pageView(),
          _pageViewDot(),
          _buttonNext(),
        ],
      ),
    );
  }

  //Cria-se um botão next para que possa passar as páginas do PageView
  Widget _buttonNext() {
    return _currentPage != _numPages - 1
        ? Expanded(
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: TextButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          )
        : Text("");
  }

  //Assim que o PageView chegar em sua última página através do buttonNext,
  //  _bottomCreateProfile() irá sobrepor um novo botão
  Widget _bottomCreateProfile() {
    return _currentPage == _numPages - 1
        ? GestureDetector(
            onTap: () {
              print("Starting...");
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()));

              //TODO mudar isso para ficar no padrão de arquitetura BLoC
              setState(() {
                setSharedPref(true);
              });
            },
            child: Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    "Leve-me ao meu Perfil",
                    style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        : Text("");
  }

  //Parte responsavel pela criação dos pontos logo a baixo do PageView.
  Row _pageViewDot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _pageIndicator(),
    );
  }

  List<Widget> _pageIndicator() {
    List<Widget> list = [];

    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 10.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Color(0xFF7B51D3),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      duration: Duration(milliseconds: 200),
    );
  }

  //Área responsavel pelo conteúdo do PageView (IMAGEM + TEXTO)
  Container _pageView() {
    return Container(
      height: 600,
      child: PageView(
        physics: ClampingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          PageViewItem(
              image: "images/vector-creator.png",
              title: "Pratique sua memória com \nMEMENTO",
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor."),
          PageViewItem(
              image: "images/image1.png",
              title: "",
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor."),
        ],
      ),
    );
  }

  //Configuração do plano de fundo
  BoxDecoration _backgroundConfig() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
          0.1,
          0.4,
          0.7,
          0.9
        ],
            colors: [
          Color(0xFF3594DD),
          Color(0xFF4563DB),
          Color(0xFF5036D5),
          Color(0xFF5B16D0),
        ]));
  }

  // Text Button responsável em passar para o NavScreen caso o utilizador não queria ler.
  Container _skipButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          print("skip");
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
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}

//Gerador de conteúdo da PageView, aqui as informações entrarão e retornarão um Widget
// com as configuração que já foram determinadas
class PageViewItem extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  PageViewItem({this.image, this.title, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              image,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            title,
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(height: 20.0),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
