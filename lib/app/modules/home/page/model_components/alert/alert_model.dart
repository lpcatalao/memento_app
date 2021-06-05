import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final ButtonStyle Function() buttonStyle;

  AlertDialogWidget(this.title, this.description, this.image, this.buttonStyle);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final alertHight = _size.height * .5;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        height: alertHight,
        width: _size.width,
        child: Stack(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 16),
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0)),
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  ElevatedButton.icon(
                      style: buttonStyle(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.done),
                      label: Text("OBRIGADO :)"))
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 16,
              right: 16,
              child: CircleAvatar(
                radius: 80.0,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  child: Image.asset(image),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
