import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intern2grow_auth/screens/login_screen.dart';
import 'package:intern2grow_auth/utils/shared/methods.dart';
import 'package:intern2grow_auth/utils/widgets/defaul_button_widget.dart';
import 'package:intern2grow_auth/utils/widgets/default_text_form_widget.dart';
import 'package:intern2grow_auth/utils/widgets/profile_cover_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});
  final Map<String, dynamic> user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isPasswordVisible = true;
  bool isRememberMeChecked = false;
  @override
  Widget build(BuildContext context) {
    userNameController.text = widget.user['username'];
    passwordController.text = widget.user['password'];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        'Profile Screen',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Gap(25),
                    DefaultTextFormField(
                      controller: userNameController,
                      // iconData: Icons.cancel_outlined,
                      lable: 'Username',
                      isPassword: false,
                    ),
                    const Gap(10),
                    // DefaultTextFormField(
                    //   controller: emailController,
                    //   isEditable: false,
                    //   lable: 'Email',
                    //   isPassword: false,
                    // ),
                    // const Gap(10),
                    DefaultTextFormField(
                      controller: passwordController,
                      // isEditable: false,k

                      lable: 'Password',
                      isPassword: isPasswordVisible,
                    ),
                    const Gap(25),
                    DefaultButton(
                      lable: 'Logout',
                      onPressed: () {
                        navigateAndKillTo(context, const LoginScreen());
                      },
                      color: Colors.red,
                    ),
                    const Gap(10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
