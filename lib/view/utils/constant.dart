import 'package:flutter/material.dart';

late double statusBarHeight;
late double heightSize, widthSize;
late double shortestSide;
late bool isMobile;
late Orientation orientation;

///Login
late double bgHeight, icphotoHeight, txtHeight, btnHeight;
late double txtWidth, btnWidth;

responsiveLayout(Orientation orientation) {
  if (orientation == Orientation.portrait) {
    if (isMobile) {
      print('potrait mobile');
      bgHeight = heightSize * 1.0;
      icphotoHeight = heightSize * 0.30;
      txtHeight = heightSize * 0.10;
      txtWidth = widthSize * 0.90;
      btnHeight = heightSize * 0.05;
      btnWidth = widthSize * 0.90;
    } else {
      print('potrait tablet');
      bgHeight = heightSize * 1.0;
      icphotoHeight = heightSize * 0.30;
      txtHeight = heightSize * 0.10;
      txtWidth = widthSize * 0.20;
      btnHeight = heightSize * 0.05;
      btnWidth = widthSize * 0.90;
    }
  } else {
    if (isMobile) {
      print('landscape mobile');
      bgHeight = heightSize * 1.0;
      icphotoHeight = heightSize * 0.30;
      txtHeight = heightSize * 0.20;
      txtWidth = widthSize * 0.70;
      btnHeight = heightSize * 0.10;
      btnWidth = widthSize * 0.70;
    } else {
      print('landscape tablet');
      bgHeight = heightSize * 1.0;
      icphotoHeight = heightSize * 0.30;
      txtHeight = heightSize * 0.10;
      btnHeight = heightSize * 0.05;
      btnWidth = widthSize * 0.90;
    }
  }
}
