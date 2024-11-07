import 'package:flutter/material.dart';

abstract class AppSizes {
  //Border
  static const double border1 = 1;

  //Radius
  static const int radius4 = 4;
  static const int radius24 = 24;
  static const int radius100 = 100;

  //Padding
  static const double paddingHorizontal = 8;

  //SizedBox Size
  static const double h1 = 1;
  static const double h2 = 2;
  static const double h3 = 3;
  static const double h4 = 4;
  static const double h5 = 5;
  static const double h6 = 6;
  static const double h7 = 7;
  static const double h8 = 8;
  static const double h9 = 9;
  static const double h10 = 10;
  static const double h11 = 11;
  static const double h12 = 12;
  static const double h13 = 13;
  static const double h14 = 14;
  static const double h15 = 15;
  static const double h16 = 16;
  static const double h17 = 17;
  static const double h18 = 18;
  static const double h19 = 19;
  static const double h20 = 20;
  static const double h21 = 21;
  static const double h22 = 22;
  static const double h23 = 23;
  static const double h24 = 24;
  static const double h25 = 25;
  static const double h26 = 26;
  static const double h27 = 27;
  static const double h28 = 28;
  static const double h29 = 29;
  static const double h30 = 30;

  static const double w1 = 1;
  static const double w2 = 2;
  static const double w3 = 3;
  static const double w4 = 4;
  static const double w5 = 5;
  static const double w6 = 6;
  static const double w7 = 7;
  static const double w8 = 8;
  static const double w9 = 9;
  static const double w10 = 10;
  static const double w11 = 11;
  static const double w12 = 12;
  static const double w13 = 13;
  static const double w14 = 14;
  static const double w15 = 15;
  static const double w16 = 16;
  static const double w17 = 17;
  static const double w18 = 18;
  static const double w19 = 19;
  static const double w20 = 20;
  static const double w21 = 21;
  static const double w22 = 22;
  static const double w23 = 23;
  static const double w24 = 24;
  static const double w25 = 25;
  static const double w26 = 26;
  static const double w27 = 27;
  static const double w28 = 28;
  static const double w29 = 29;
  static const double w30 = 30;

  //Design
  static const double designScreenWidth = 375;
  static const double designScreenHeight = 812;

  //Screen
  static final double appBarSize = AppBar().preferredSize.height;
  static final double devicePixelRatio = WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
  static final double currentScreenHeight =
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height / devicePixelRatio;
  static final double currentScreenWidth =
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width / devicePixelRatio;
  static final double screenPaddingTop =
      WidgetsBinding.instance.platformDispatcher.views.first.padding.top / devicePixelRatio;
  static final double screenPaddingBottom =
      WidgetsBinding.instance.platformDispatcher.views.first.padding.bottom / devicePixelRatio;
  static final double screenInsetBottom =
      WidgetsBinding.instance.platformDispatcher.views.first.viewInsets.bottom / devicePixelRatio;
  static final double screenResolutionWidthHeight = currentScreenWidth / currentScreenHeight;
}
