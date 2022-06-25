import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/bloc/user/user_bloc.dart';
import 'package:suitmedia/model/user/user.dart';
import 'package:suitmedia/view/utils/common/topbar.dart';
import 'package:suitmedia/view/utils/constant.dart';

class UserView extends StatelessWidget {
  String? name;
  User? user;

  @override
  Widget build(BuildContext context) {
    heightSize = MediaQuery.of(context).size.height;
    widthSize = MediaQuery.of(context).size.width;

    shortestSide = MediaQuery.of(context).size.shortestSide;
    isMobile = shortestSide < 600.0;
    orientation = MediaQuery.of(context).orientation;

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        /* if (state is AuthenticatedState) {
          name = state.name;
          return Stack(
            children: [
              Scaffold(
                backgroundColor: bgColor,
                appBar: TopBar(
                  theme: bgColor,
                  icon: Icons.arrow_back_ios_new_rounded,
                  title: 'Users',
                ),
                body: body(context, orientation),
              ),
            ],
          );
        } */

        return Stack(
          children: [
            Scaffold(
              backgroundColor: bgColor,
              appBar: TopBar(
                theme: bgColor,
                icon: Icons.arrow_back_ios_new_rounded,
                title: 'Users',
              ),
              body: body(context, orientation, user!),
            ),
          ],
        );
      },
    );
  }

  body(context, Orientation orientation, User user) {
    ///Responsive layout
    responsiveLayout(orientation);

    /* return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [],
            ),
          ),
        ),
      ],
    ); */
    return ListView.builder(
      itemCount: user.data!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                //SmartDialog.showToast(surah.data![index].number.toString());
              },
              leading: Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/icon/octagonal.png"),
                  ),
                ),
                child: Center(
                  child: Text(
                    "${user.data![index].first_name}",
                    style: TextStyle(
                      color: txtColor,
                    ),
                  ),
                ),
              ),
              title: Text(
                '${user.data![index].email}',
                style: const TextStyle(
                  color: Color(0XFF260F68),
                ),
              ),
              /* subtitle: Text(
                '${user.data![index].revelationType} - ${surah.data![index].numberOfAyahs} verses',
                style: const TextStyle(
                  color: Color.fromARGB(255, 168, 167, 168),
                ),
              ), */
              /* trailing: SizedBox(
                height: tabCHeight * 0.08,
                child: FittedBox(
                  child: Text(
                    '${surah.data![index].name}',
                    style: const TextStyle(
                      color: Color(0XFF9345F2),
                      fontFamily: 'Noorehidayat',
                    ),
                  ),
                ),
              ), */
            ),
            Divider(height: 25, thickness: 2, color: Colors.grey[300]),
          ],
        );
      },
    );
  }
}
