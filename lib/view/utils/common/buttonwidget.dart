import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  double? btnHeight;
  double? btnWidth;
  EdgeInsets? margin;
  String? label;
  void Function()? onPress;

  ButtonWidget({
    Key? key,
    this.btnHeight,
    this.btnWidth,
    this.margin,
    this.label,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: btnHeight,
      width: btnWidth,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF2B637B), // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: onPress,
        child: Text('$label'),
      ),
    );
  }
}
