//Gerador de conteúdo da PageView, aqui as informações entrarão e retornarão um Widget
// com as configuração que já foram determinadas
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  PageViewItem({this.image, this.title, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            child: Image.asset(
              image,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width *.8,
            child: Text(title,
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Montserrat",
                    fontStyle: FontStyle.normal,
                    fontSize: 40.0),
                textAlign: TextAlign.center),
          ),
        ),
        SizedBox(height: 20.0),
        // Body text
        Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            child: Text(text,
                style: const TextStyle(
                    color: const Color(0xff1a1a1a),
                    fontWeight: FontWeight.w300,
                    fontFamily: "OpenSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 19.0),
                textAlign: TextAlign.center),
          ),
        )
      ],
    );
  }
}
