class SizeConfig {
  // static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;

  // static Orientation orientation;

  double getProportionNateScreenHeight(double inputHeight) {
    double screenHeight = SizeConfig.screenHeight;

    // 812 é o tamanho em altura de layout que os designers usam
    return (inputHeight / 812.0) * screenHeight;
  }

  double getProportionNateScreenWidth(double inputWidth){
    double screenWidth = SizeConfig.screenWidth;
    // 375 é o tamanho em largura de layout que os designers usam
    return (inputWidth / 375.0) * screenWidth;
  }
}
