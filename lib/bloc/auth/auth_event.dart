part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}

class NextEvent extends AuthEvent {
  String? name;

  NextEvent({this.name});
}
