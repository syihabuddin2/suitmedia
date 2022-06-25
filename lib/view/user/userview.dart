import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:suitmedia/bloc/user/user_bloc.dart';
import 'package:suitmedia/model/user/user.dart';
import 'package:suitmedia/view/utils/common/textwidget.dart';
import 'package:suitmedia/view/utils/common/topbar.dart';
import 'package:suitmedia/view/utils/constant.dart';

class UserView extends StatelessWidget {
  User? user;

  @override
  Widget build(BuildContext context) {
    heightSize = MediaQuery.of(context).size.height;
    widthSize = MediaQuery.of(context).size.width;

    shortestSide = MediaQuery.of(context).size.shortestSide;
    isMobile = shortestSide < 600.0;
    orientation = MediaQuery.of(context).orientation;

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoading) {
          SmartDialog.showLoading();
        } else {
          SmartDialog.dismiss();
        }

        if (state is UserSelectedSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            user = state.user;
            return Scaffold(
              backgroundColor: bgColor,
              appBar: TopBar(
                theme: bgColor,
                icon: Icons.arrow_back_ios_new_rounded,
                title: 'Users',
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              body: body(context, orientation, user!),
            );
          }

          return Stack(
            children: [
              Scaffold(
                backgroundColor: bgColor,
                appBar: TopBar(
                  theme: bgColor,
                  icon: Icons.arrow_back_ios_new_rounded,
                  title: 'Users',
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  body(context, Orientation orientation, User user) {
    ///Responsive layout
    responsiveLayout(orientation);

    var userbloc = BlocProvider.of<UserBloc>(context, listen: true);

    return ListView.builder(
      itemCount: user.data!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                userbloc.add(SelectedUserEvent(
                  imgPath: '${user.data![index].avatar}',
                  name:
                      '${user.data![index].first_name} ${user.data![index].last_name}',
                  email: '${user.data![index].email}',
                ));
              },
              leading: Container(
                width: imgWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network('${user.data![index].avatar}').image,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              title: TextWidget(
                txtHeight: txtHeight,
                scale: isMobile ? 0.90 : 0.60,
                mainAxis: MainAxisAlignment.start,
                label:
                    '${user.data![index].first_name} ${user.data![index].last_name}',
                color: txtColor,
              ),
              subtitle: TextWidget(
                txtHeight: txtHeight,
                scale: isMobile ? 0.70 : 0.46,
                mainAxis: MainAxisAlignment.start,
                label: '${user.data![index].email}',
                color: txt3Color,
              ),
            ),
            Divider(height: 25, thickness: 2, color: Colors.grey[300]),
          ],
        );
      },
    );
  }
}
