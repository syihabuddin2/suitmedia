import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia/view/utils/constant.dart';

class ButtonWidget extends StatelessWidget {
  double? btnHeight;
  double? btnWidth;
  EdgeInsets? padding;
  String? label;
  void Function()? onPress;

  ButtonWidget({
    Key? key,
    this.btnHeight,
    this.btnWidth,
    this.padding,
    this.label,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: SizedBox(
        height: btnHeight,
        width: btnWidth,
        child: SizedBox(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColor, // background
              onPrimary: onprimaryColor, // foreground
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: onPress,
            child: Text('$label'),
          ),
        ),
      ),
    );
  }
}
