import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia/view/utils/constant.dart';

class TextWidget extends StatelessWidget {
  double? txtHeight;
  double? txtWidth;
  double scale;
  EdgeInsets? margin;
  MainAxisAlignment mainAxis;
  String? label;
  Color? color;
  TextAlign? textAlign;
  FontWeight? fontWeight;

  TextWidget({
    Key? key,
    this.txtHeight,
    this.txtWidth,
    required this.scale,
    this.margin,
    required this.mainAxis,
    this.label,
    this.color,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: txtHeight!,
      child: Row(
        mainAxisAlignment: mainAxis,
        children: [
          SizedBox(
            height: txtHeight! * scale,
            child: FittedBox(
              child: Text(
                "$label",
                textAlign: textAlign,
                style: TextStyle(
                  color: color,
                  fontWeight:
                      fontWeight != null ? fontWeight! : FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
