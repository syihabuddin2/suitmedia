import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoading());

  AuthState get initialState => AuthInitialState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is NextEvent) {
      yield AuthLoading();

      if (event.name != "") {
        yield AuthenticatedState(
          name: event.name,
        );
      } else {
        yield AuthError(error: 'Please enter your name');
      }
    }
  }
}
