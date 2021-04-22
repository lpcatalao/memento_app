import 'package:flutter/cupertino.dart';

class ScreenSizeUtil {
  Size _mediaQuery;

  double get height => _mediaQuery.height;

  double get width => _mediaQuery.width;

  ScreenSizeUtil(BuildContext context) {
    this._mediaQuery = MediaQuery.of(context).size;
  }
}
