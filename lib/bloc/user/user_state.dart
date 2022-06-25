part of 'user_bloc.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserSuccess extends UserState {
  User? user;

  UserSuccess({this.user});
}

class UserSelectedSuccess extends UserState {
  String? imgPath;
  String? name;
  String? email;

  UserSelectedSuccess({this.imgPath, this.name, this.email});
}

class UserLoading extends UserState {}

class UserError extends UserState {
  String? error;

  UserError({this.error});
}
