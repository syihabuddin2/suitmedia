part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthenticatedState extends AuthState {
  String? name;

  AuthenticatedState({
    this.name,
  });
}

class UnAuthenticatedState extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError({required this.error});
}
