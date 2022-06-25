part of 'user_bloc.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserSuccess extends UserState {
  User? user;

  UserSuccess({this.user});
}

class UserLoading extends UserState {}

class UserError extends UserState {
  String? error;

  UserError({this.error});
}
