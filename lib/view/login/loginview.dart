import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:suitmedia/bloc/auth/auth_bloc.dart';
import 'package:suitmedia/view/home/homeview.dart';
import 'package:suitmedia/view/utils/common/buttonwidget.dart';
import 'package:suitmedia/view/utils/common/textfieldwidget.dart';
import 'package:suitmedia/view/utils/constant.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldLoginKey = GlobalKey<ScaffoldState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    heightSize = MediaQuery.of(context).size.height;
    widthSize = MediaQuery.of(context).size.width;

    shortestSide = MediaQuery.of(context).size.shortestSide;
    isMobile = shortestSide < 600.0;
    orientation = MediaQuery.of(context).orientation;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          SmartDialog.showLoading();
        } else {
          SmartDialog.dismiss();
        }

        if (state is AuthError) {
          SmartDialog.showToast(state.error.toString());
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          print("AuthState login view: ${state}");
          if (state is AuthenticatedState) {
            return HomeView();
          }

          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background/background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: body(context, orientation),
              ),
            ],
          );
        },
      ),
    );
  }

  body(context, Orientation orientation) {
    ///Responsive layout
    responsiveLayout(orientation);

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: icphotoHeight,
                  margin: EdgeInsets.only(top: icphotoHeight * 0.35),
                  child: const Image(
                    image: AssetImage("assets/ic_photo/ic_photo.png"),
                  ),
                ),
                TextFieldWidget(
                  txtHeight: txtHeight,
                  txtWidth: txtWidth,
                  txtController: nameController,
                  label: 'Name',
                ),
                TextFieldWidget(
                  txtHeight: txtHeight,
                  txtWidth: txtWidth,
                  txtController: palindromeController,
                  label: 'Palindrome',
                ),
                ButtonWidget(
                  btnHeight: btnHeight,
                  btnWidth: btnWidth,
                  margin: EdgeInsets.only(top: btnHeight * 0.80),
                  label: 'Check'.toUpperCase(),
                  onPress: () {
                    check();
                  },
                ),
                ButtonWidget(
                  btnHeight: btnHeight,
                  btnWidth: btnWidth,
                  margin: EdgeInsets.only(top: btnHeight * 0.40),
                  label: 'Next'.toUpperCase(),
                  onPress: () {
                    BlocProvider.of<AuthBloc>(context).add(
                      NextEvent(
                        name: nameController.text,
                      ),
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

  check() {
    String? original = palindromeController.text;
    String? reverse = original.split('').reversed.join('');

    if (original == reverse) {
      print('isPalindrome');
      SmartDialog.showToast('isPalindrome');
    } else {
      print('Not Palindrome');
      SmartDialog.showToast('Not Palindrome');
    }
  }
}
