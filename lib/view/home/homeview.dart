import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/bloc/auth/auth_bloc.dart';
import 'package:suitmedia/bloc/user/user_bloc.dart';
import 'package:suitmedia/view/user/userview.dart';
import 'package:suitmedia/view/utils/common/buttonwidget.dart';
import 'package:suitmedia/view/utils/common/textwidget.dart';
import 'package:suitmedia/view/utils/common/topbar.dart';
import 'package:suitmedia/view/utils/constant.dart';
import 'package:suitmedia/view/web/webview.dart';

class HomeView extends StatelessWidget {
  String? name;

  @override
  Widget build(BuildContext context) {
    heightSize = MediaQuery.of(context).size.height;
    widthSize = MediaQuery.of(context).size.width;

    shortestSide = MediaQuery.of(context).size.shortestSide;
    isMobile = shortestSide < 600.0;
    orientation = MediaQuery.of(context).orientation;

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        print('home state: ${state}');

        if (state is UserSuccess) {
          return UserView();
        }
        return Stack(
          children: [
            Scaffold(
              backgroundColor: bgColor,
              appBar: TopBar(
                theme: bgColor,
                icon: Icons.arrow_back_ios_new_rounded,
                title: 'Home',
                onTap: () {
                  // Navigator.pop(context);
                  // print('pop');
                },
              ),
              body: body(context, orientation),
            ),
          ],
        );
      },
    );
  }

  body(context, Orientation orientation) {
    ///Responsive layout
    responsiveLayout(orientation);

    var userbloc = BlocProvider.of<UserBloc>(context, listen: true);

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                TextWidget(
                  txtHeight: txtHeight,
                  scale: 0.60,
                  mainAxis: MainAxisAlignment.start,
                  label: 'Welcome',
                  color: txtColor,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthenticatedState) {
                      name = state.name;
                      return TextWidget(
                        txtHeight: txtHeight,
                        scale: 0.90,
                        mainAxis: MainAxisAlignment.start,
                        label: '$name',
                        fontWeight: FontWeight.bold,
                        color: txtColor,
                      );
                    }

                    return TextWidget(
                      txtHeight: txtHeight,
                      scale: 0.90,
                      mainAxis: MainAxisAlignment.start,
                      label: 'Nama',
                      fontWeight: FontWeight.bold,
                      color: txtColor,
                    );
                  },
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserSelectedSuccess) {
                      return Container(
                        height: profilHeight,
                        width: profilWidth,
                        margin: EdgeInsets.only(top: profilHeight * 0.35),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: state.imgPath != ' '
                                ? Image.network('${state.imgPath}').image
                                : const AssetImage("assets/profil/image2.png"),
                          ),
                          shape: BoxShape.circle,
                        ),
                      );
                    }

                    return Container(
                      height: profilHeight,
                      width: profilWidth,
                      margin: EdgeInsets.only(top: profilHeight * 0.35),
                      child: const Image(
                        image: AssetImage("assets/profil/image2.png"),
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserSelectedSuccess) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextWidget(
                              txtHeight: txtHeight,
                              scale: 0.90,
                              mainAxis: MainAxisAlignment.center,
                              label: '${state.name}',
                              color: txtTitleColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextWidget(
                              txtHeight: txtHeight,
                              scale: 0.90,
                              mainAxis: MainAxisAlignment.center,
                              label: '${state.email}',
                              color: txtEmailColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextWidget(
                              txtHeight: txtHeight,
                              scale: 0.90,
                              mainAxis: MainAxisAlignment.center,
                              label: 'website',
                              color: primaryColor,
                              textDecoration: TextDecoration.underline,
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebLaunchView()),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }

                    return TextWidget(
                      txtHeight: txtHeight,
                      scale: 0.90,
                      mainAxis: MainAxisAlignment.center,
                      label: 'Select a user to show the profile',
                      color: txt2Color,
                    );
                  },
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserSelectedSuccess) {
                      return ButtonWidget(
                        btnHeight: btnHeight,
                        btnWidth: btnWidth,
                        padding: EdgeInsets.only(top: heightSize * 0.14),
                        label: 'Choose a User',
                        onPress: () {
                          userbloc.add(ChooseUserEvent());
                        },
                      );
                    }

                    return ButtonWidget(
                      btnHeight: btnHeight,
                      btnWidth: btnWidth,
                      padding: EdgeInsets.only(top: heightSize * 0.25),
                      label: 'Choose a User',
                      onPress: () {
                        userbloc.add(ChooseUserEvent());
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
