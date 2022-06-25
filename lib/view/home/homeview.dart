import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/bloc/auth/auth_bloc.dart';
import 'package:suitmedia/bloc/user/user_bloc.dart';
import 'package:suitmedia/view/user/userview.dart';
import 'package:suitmedia/view/utils/common/buttonwidget.dart';
import 'package:suitmedia/view/utils/common/textwidget.dart';
import 'package:suitmedia/view/utils/common/topbar.dart';
import 'package:suitmedia/view/utils/constant.dart';

class HomeView extends StatelessWidget {
  String? name;

  @override
  Widget build(BuildContext context) {
    heightSize = MediaQuery.of(context).size.height;
    widthSize = MediaQuery.of(context).size.width;

    shortestSide = MediaQuery.of(context).size.shortestSide;
    isMobile = shortestSide < 600.0;
    orientation = MediaQuery.of(context).orientation;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          name = state.name;
          return BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                UserView();
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
                        Navigator.pop(context);
                        print('pop');
                      },
                    ),
                    body: body(context, orientation),
                  ),
                ],
              );
            },
          );
        }

        return Stack(
          children: [
            Scaffold(
              backgroundColor: bgColor,
              appBar: TopBar(
                theme: bgColor,
                icon: Icons.arrow_back_ios_new_rounded,
                title: 'Home',
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

    //var bloc = context.watch<HomeBloc>();
    //var bloc = BlocProvider.of<HomeBloc>(context, listen: true);

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
                TextWidget(
                  txtHeight: txtHeight,
                  scale: 0.90,
                  mainAxis: MainAxisAlignment.start,
                  label: '$name',
                  fontWeight: FontWeight.bold,
                  color: txtColor,
                ),
                Container(
                  height: profilHeight,
                  width: profilWidth,
                  margin: EdgeInsets.only(top: profilHeight * 0.35),
                  child: const Image(
                    image: AssetImage("assets/profil/image2.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                TextWidget(
                  txtHeight: txtHeight,
                  scale: 0.90,
                  mainAxis: MainAxisAlignment.center,
                  label: 'Select a user to show the profile',
                  color: txt2Color,
                ),
                ButtonWidget(
                  btnHeight: btnHeight,
                  btnWidth: btnWidth,
                  padding: EdgeInsets.only(top: heightSize * 0.30),
                  label: 'Choose a User',
                  onPress: () {
                    BlocProvider.of<UserBloc>(context).add(
                      ChooseUserEvent(),
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
