import 'package:flutter/material.dart';
import 'package:suitmedia/view/utils/constant.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  Color? theme;
  IconData? icon;
  double? iconHeight;
  String? title;
  void Function()? onTap;

  TopBar({
    Key? key,
    this.theme,
    this.icon,
    this.iconHeight,
    this.title,
    this.onTap,
  }) : super(key: key);

  late Size size;

  @override
  Size get preferredSize {
    size = const Size.fromHeight(50.0);
    return size;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: theme,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(icon, color: primaryColor),
        onPressed: onTap,
      ),
      centerTitle: true,
      title: SizedBox(
        height: size.height * 0.40,
        child: FittedBox(
          child: Text(
            title!,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
