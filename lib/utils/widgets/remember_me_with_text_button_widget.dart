import 'package:flutter/material.dart';

class RememberMeWithTextButtonWidget extends StatelessWidget {
  const RememberMeWithTextButtonWidget({
    super.key,
    required this.isRememberMeChecked,
    required this.onChanged,
    required this.isRegisterScreen,
    required this.onTextButtonPressed,
  });
  final bool isRegisterScreen;
  final void Function() onTextButtonPressed;

  final bool isRememberMeChecked;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: isRememberMeChecked,
              onChanged: onChanged,
            ),
            const Text(
              'Remember me',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: onTextButtonPressed,
          child: Text(
            isRegisterScreen ? 'Have a problem?' : 'Forgot password?',
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
