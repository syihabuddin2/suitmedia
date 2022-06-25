part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class ChooseUserEvent extends UserEvent {}

class SelectedUserEvent extends UserEvent {
  String? imgPath;
  String? name;
  String? email;

  SelectedUserEvent({this.imgPath, this.name, this.email});
}
