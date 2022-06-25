import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';
import 'package:suitmedia/model/user/user.dart';
import 'package:suitmedia/services/user/userservice.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserService userService;

  UserBloc({required this.userService}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is ChooseUserEvent) {
      try {
        yield UserLoading();
        final responseUserData = await userService.getUser(id: 1);

        if (responseUserData.data != null) {
          yield UserSuccess(user: responseUserData);
        }
      } catch (e) {
        yield UserError(error: e.toString());
      }
    }

    if (event is SelectedUserEvent) {
      try {
        yield UserLoading();

        yield UserSelectedSuccess(
          imgPath: event.imgPath != ' ' ? event.imgPath : ' ',
          name: event.name != ' ' ? event.name : ' ',
          email: event.email != ' ' ? event.email : ' ',
        );
      } catch (e) {
        yield UserError(error: e.toString());
      }
    }
  }
}
