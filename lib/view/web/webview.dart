import 'dart:io';

import 'package:flutter/material.dart';
import 'package:suitmedia/view/utils/common/topbar.dart';
import 'package:suitmedia/view/utils/constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebLaunchView extends StatefulWidget {
  @override
  State<WebLaunchView> createState() => _WebLaunchViewState();
}

class _WebLaunchViewState extends State<WebLaunchView> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightSize = MediaQuery.of(context).size.height;
    widthSize = MediaQuery.of(context).size.width;

    shortestSide = MediaQuery.of(context).size.shortestSide;
    isMobile = shortestSide < 600.0;
    orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: TopBar(
        theme: bgColor,
        icon: Icons.arrow_back_ios_new_rounded,
        title: 'Website',
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: body(context, orientation),
    );
  }

  body(context, Orientation orientation) {
    ///Responsive layout
    responsiveLayout(orientation);

    return SizedBox(
      height: webHeight,
      width: webWidth,
      child: const WebView(
        initialUrl: 'https://suitmedia.com/',
      ),
    );
  }
}
