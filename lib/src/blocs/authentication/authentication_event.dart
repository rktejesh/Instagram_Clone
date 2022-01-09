part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppLoaded extends AuthenticationEvent {}

class UserLoggedIn extends AuthenticationEvent {
  final String email;
  final String token;
  const UserLoggedIn({required this.email, required this.token});

  @override
  List<Object> get props => [email, token];
}

class UserLoggedOut extends AuthenticationEvent {}

class UserDeleted extends AuthenticationEvent {}
