import 'package:flutter/material.dart';

void main() {
  runApp(Memento());
}

class Memento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memento App Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Memento"),
        ),
        body: Center(
            child: Text("Welcome to Memento")) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}





