import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';

class DashboardAppBar extends StatelessWidget {
  final double width;
  final double height;

  DashboardAppBar({@required this.width, @required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(1, 0),
              end: Alignment(0, 0.5938237309455872),
              colors: [GeneralAppColor.customAppBar1, GeneralAppColor.customAppBar2]),
          color: Colors.black,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15))),
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.transparent,
              width: width * .8,
              height: height / 2.5,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá José',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Bem vindo, você já olhou as suas fotos antigas hoje?',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              height: height / 3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  horizontalList(1, Colors.white),
                  horizontalList(2, Colors.white),
                  horizontalList(3, Colors.white),
                  horizontalList(4, Colors.white),
                  horizontalList(5, Colors.white),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding horizontalList(int index, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(12))),
        width: 130,
        child: Text('Conteudo ${index}'),
      ),
    );
  }
}
