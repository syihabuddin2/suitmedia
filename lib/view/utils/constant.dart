import 'package:flutter/material.dart';

late double statusBarHeight;
late double heightSize, widthSize;
late double shortestSide;
late bool isMobile;
late Orientation orientation;

///Login
late double bgHeight, icphotoHeight, txtFieldHeight, txtHeight, btnHeight;
late double txtFieldWidth, txtWidth, btnWidth;

///Home
late double profilHeight;
late double profilWidth;

responsiveLayout(Orientation orientation) {
  if (orientation == Orientation.portrait) {
    if (isMobile) {
      print('potrait mobile');

      ///Login
      bgHeight = heightSize * 1.0;
      icphotoHeight = heightSize * 0.30;
      txtFieldHeight = heightSize * 0.10;
      txtFieldWidth = widthSize * 0.90;
      btnHeight = heightSize * 0.05;
      btnWidth = widthSize * 0.90;

      ///Home
      profilHeight = heightSize * 0.30;
      profilWidth = widthSize * 0.40;
      txtHeight = heightSize * 0.03;
      txtWidth = widthSize * 0.90;
    } else {
      print('potrait tablet');
      bgHeight = heightSize * 1.0;
      icphotoHeight = heightSize * 0.30;
      txtFieldHeight = heightSize * 0.10;
      txtFieldWidth = widthSize * 0.20;
      btnHeight = heightSize * 0.05;
      btnWidth = widthSize * 0.90;

      ///Home
      profilHeight = heightSize * 0.30;
      profilWidth = widthSize * 0.40;
      txtHeight = heightSize * 0.10;
      txtWidth = widthSize * 0.20;
    }
  } else {
    if (isMobile) {
      print('landscape mobile');
      bgHeight = heightSize * 1.0;
      icphotoHeight = heightSize * 0.30;
      txtFieldHeight = heightSize * 0.20;
      txtFieldWidth = widthSize * 0.70;
      btnHeight = heightSize * 0.10;
      btnWidth = widthSize * 0.70;

      ///Home
      profilHeight = heightSize * 0.30;
      profilWidth = widthSize * 0.40;
      txtHeight = heightSize * 0.10;
      txtWidth = widthSize * 0.90;
    } else {
      print('landscape tablet');
      bgHeight = heightSize * 1.0;
      icphotoHeight = heightSize * 0.30;
      txtFieldHeight = heightSize * 0.20;
      txtFieldWidth = widthSize * 0.70;
      btnHeight = heightSize * 0.05;
      btnWidth = widthSize * 0.90;

      ///Home
      profilHeight = heightSize * 0.30;
      profilWidth = widthSize * 0.40;
      txtHeight = heightSize * 0.10;
      txtWidth = widthSize * 0.90;
    }
  }
}

///Color
var primaryColor = Color(0xFF2B637B);
var onprimaryColor = Colors.white;
var bgColor = Color(0xFFFFFFFF);
var txtColor = Color(0xFF04021D);
var txt2Color = Colors.grey;
