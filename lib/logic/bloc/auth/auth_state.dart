part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthRegLoading extends AuthState {}

final class AuthLogInLoading extends AuthState {}

final class AuthAuthed extends AuthState {}

final class AuthUnauthed extends AuthState {}

final class AuthRegFailed extends AuthState {
  final String msg;

  AuthRegFailed({required this.msg});
}

final class AuthLogInFailed extends AuthState {
  final String msg;

  AuthLogInFailed({required this.msg});
}
