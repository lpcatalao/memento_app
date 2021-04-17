import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Dialog"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Click Button"),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomDialog(
                    title: "Hello",
                    description: "Alguma coisa",
                    buttonText: "Alguma coisa",
                  );
                });
          },
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  const CustomDialog(
      {Key key, this.title, this.description, this.buttonText, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 100,
            bottom: 16,
            right: 16,
            left: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(height: 24.0),
              Text(description, style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 25.0),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Confirm"),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: Image.network("/images/umgif.gif")
          // child: CircleAvatar(
          //   backgroundColor: Colors.blue,
          //   radius: 100,
          //   backgroundImage: AssetImage("images/umgif.gif"),
          // ),
        )
      ],
    );
  }
}
