import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final http.Client _client = http.Client();
  final _headers = {
    'Content-Type': 'application/json',
  };
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  void login({
    required String username,
    required String password,
  }) async {
    emit(AuthLoginLoadingState());
    final body = jsonEncode({
      'username': 'kminchelle',
      'password': '0lelplR',
    });
    _client
        .post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: _headers,
      body: body,
    )
        .then((value) async {
      if (value.statusCode == 200) {
        print(value.body);
        String user = await _getUser(username);
        if (user == '') {
          emit(AuthLoginErrorState(
            'Username or password is incorrect',
          ));
        } else {
          emit(AuthLoginSuccessState({
            'username': username,
            'password': password,
          }));
        }
      } else {
        print(value.body);
      }
    }).catchError((error) {
      emit(AuthLoginErrorState(error.toString()));
      print(error.toString());
    });
  }

  void register(
      {required String username,
      required String password,
      required String email}) {
    emit(AuthRegisterLoadingState());
    final body = jsonEncode({
      'username': 'kminchelle',
      'password': '0lelplR',
    });
    _client
        .post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: _headers,
      body: body,
    )
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        _cacheUser(password: password, username: username, email: email);
        emit(
          AuthRegisterSuccessState({
            'username': username,
            'password': password,
          }),
        );
      } else {
        print(value.body);
      }
    }).catchError((error) {
      emit(AuthRegisterErrorState(error.toString()));
      print(error.toString());
    });
  }

  void logout() {}

  void _cacheUser(
      {required String password,
      required String username,
      required String email}) {
    SharedPreferences.getInstance().then((value) {
      value.setString(
        username,
        jsonEncode(
          {
            'username': username,
            'password': password,
            'email': email,
          },
        ),
      );
    });
  }

  Future<String> _getUser(String username) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getString(username) ?? '';
  }
}
