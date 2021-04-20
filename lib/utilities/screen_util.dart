import 'package:flutter/cupertino.dart';

class ScreenSize {
  Size _mediaQuery;

  double get height => _mediaQuery.height;

  double get width => _mediaQuery.width;

  ScreenSize(BuildContext context) {
    this._mediaQuery = MediaQuery.of(context).size;
  }
}
