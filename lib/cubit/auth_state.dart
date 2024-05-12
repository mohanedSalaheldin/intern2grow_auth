part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoginLoadingState extends AuthState {}

class AuthLoginErrorState extends AuthState {
  final String error;
  AuthLoginErrorState(this.error);
}

class AuthLoginSuccessState extends AuthState {
  final Map<String, dynamic> user;
  AuthLoginSuccessState(this.user);
}

class AuthRegisterLoadingState extends AuthState {}

class AuthRegisterErrorState extends AuthState {
  final String error;
  AuthRegisterErrorState(this.error);
}

class AuthRegisterSuccessState extends AuthState {
  final Map<String, dynamic> user;
  AuthRegisterSuccessState(this.user);
}
