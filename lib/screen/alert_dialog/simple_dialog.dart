import 'package:flutter/material.dart';

class MySimpleAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("algum texto aqui"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Click me!"),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Hello"),
                    content: Text("aqui vem um texto dentro, seria o conteudo"),
                    actions: [
                      FlatButton(
                        child: Text("Yes"),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Text("No"),
                        onPressed: () {},
                      )
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
