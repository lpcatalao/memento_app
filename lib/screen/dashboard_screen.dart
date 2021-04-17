import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.deepPurpleAccent),
        child: Center(
          child: Text("Dashboard"),
        ),
      ),
    );
  }
}
