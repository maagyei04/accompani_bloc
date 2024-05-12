part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthDone extends AuthState {
  final String message;
  AuthDone(this.message);
}

final class AuthSuccess extends AuthState {
  final User user;
  AuthSuccess(this.user);
}

final class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
