import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern2grow_auth/bloc_observer.dart';
import 'package:intern2grow_auth/cubit/auth_cubit.dart';
import 'package:intern2grow_auth/screens/login_screen.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: RegisterScreen(),
        home: LoginScreen(),
        // home: ProfileScreen(),
      ),
    );
  }
}
