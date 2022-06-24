import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  double? txtHeight;
  double? txtWidth;
  TextEditingController? txtController;
  String? label;

  TextFieldWidget({
    Key? key,
    this.txtHeight,
    this.txtWidth,
    this.txtController,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: txtHeight,
      width: txtWidth,
      child: Center(
        child: TextField(
          obscureText: false,
          controller: txtController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            labelText: label != null ? '$label' : ' ',
            filled: true,
            fillColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }
}
