import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:intern2grow_auth/cubit/auth_cubit.dart';
import 'package:intern2grow_auth/screens/profile_screen.dart';
import 'package:intern2grow_auth/screens/register_screen.dart';
import 'package:intern2grow_auth/utils/shared/methods.dart';
import 'package:intern2grow_auth/utils/widgets/already_have_or_have_not_account_widget.dart';
import 'package:intern2grow_auth/utils/widgets/defaul_button_widget.dart';
import 'package:intern2grow_auth/utils/widgets/default_text_form_widget.dart';
import 'package:intern2grow_auth/utils/widgets/profile_cover_widget.dart';
import 'package:intern2grow_auth/utils/widgets/remember_me_with_text_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isPasswordVisible = true;
  bool isRememberMeChecked = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginSuccessState) {
            Map<String, dynamic> user = state.user;
            navigateAndKillTo(
                context,
                ProfileScreen(
                  user: user,
                ));
          }
          if (state is AuthLoginErrorState) {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          if (state is AuthLoginLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthLoginErrorState) {
            return const Center(
              child: Text('Error Accoured'),
            );
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const ProfileAndCoverWidget(isProfileScreen: false),
                    const Gap(25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Log in to your account',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const Gap(25),
                          DefaultTextFormField(
                            controller: userNameController,
                            iconData: Icons.cancel_outlined,
                            lable: 'Username',
                            isPassword: false,
                          ),
                          const Gap(10),
                          DefaultTextFormField(
                            controller: passwordController,
                            iconData: Icons.visibility_outlined,
                            lable: 'Password',
                            isPassword: isPasswordVisible,
                          ),
                          const Gap(10),
                          RememberMeWithTextButtonWidget(
                            isRegisterScreen: false,
                            onTextButtonPressed: () {},
                            isRememberMeChecked: isRememberMeChecked,
                            onChanged: (value) {
                              setState(() {
                                isRememberMeChecked = !isRememberMeChecked;
                              });
                            },
                          ),
                          const Gap(10),
                          DefaultButton(
                            lable: 'Login',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                AuthCubit.get(context).login(
                                  username: userNameController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                          ),
                          const Gap(10),
                          AlreadyHaveOrHaveNotAnAccountWidget(
                            isRegisterScreen: false,
                            onTextButtonPressed: () {
                              navigateAndKillTo(
                                  context, const RegisterScreen());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
