part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoggedInEvent extends AuthEvent {}

class LoggedOutEvent extends AuthEvent {
  final bool isLogOut;
  LoggedOutEvent({
    required this.isLogOut,
  });
}

class RegisterEvent extends AuthEvent {
  final String fullname;
  final String email;
  final String password;

  RegisterEvent({
    required this.fullname,
    required this.email,
    required this.password,
  });
}

class LogInEvent extends AuthEvent {
  final String email;
  final String password;

  LogInEvent({
    required this.email,
    required this.password,
  });
}

class LogInGoogleEvent extends AuthEvent {}
