import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:suitmedia/bloc/auth/auth_bloc.dart';
import 'package:suitmedia/bloc/user/user_bloc.dart';
import 'package:suitmedia/services/user/userservice.dart';
import 'package:suitmedia/view/login/loginview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) {
            return AuthBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return UserBloc(userService: UserService());
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          return LoginView();
        }),
      ),
    );
  }
}
