import 'package:flutter/material.dart';


class MediaQueryUtil {
  static double widgetHeight(BuildContext context, double pixels) {
    double designHeight = 844;
    return MediaQuery.of(context).size.height / (designHeight / pixels);
  }

  static double widgetWidth(BuildContext context, double pixels) {
    double designWidth = 390;
    return MediaQuery.of(context).size.width / (designWidth / pixels);
  }
}




