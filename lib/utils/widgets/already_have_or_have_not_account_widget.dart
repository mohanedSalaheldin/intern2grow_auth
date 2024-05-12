import 'package:flutter/material.dart';

class AlreadyHaveOrHaveNotAnAccountWidget extends StatelessWidget {
  const AlreadyHaveOrHaveNotAnAccountWidget({
    super.key,
    required this.isRegisterScreen,
    required this.onTextButtonPressed,
  });
  final bool isRegisterScreen;
  final void Function() onTextButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          isRegisterScreen
              ? 'Already have an account?'
              : 'Don’t have an account?',
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          onPressed: onTextButtonPressed,
          child: Text(
            isRegisterScreen ? 'Log in' : 'Register',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}