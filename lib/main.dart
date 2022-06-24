import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:suitmedia/bloc/auth/auth_bloc.dart';
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
            return AuthBloc()..add(AppStarted());
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthInitialState) {
            return LoginView();
          } else if (state is UnAuthenticatedState) {
            return LoginView();
          } /* else if (state is AuthenticatedState) {
            return HomeView();
          }  */
          else {
            return LoginView();
          }
        }),
      ),
    );
  }
}
