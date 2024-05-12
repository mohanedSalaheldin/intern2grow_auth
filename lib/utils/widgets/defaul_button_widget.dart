import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.lable,
    this.color = const Color.fromARGB(255, 33, 114, 243),
  });
  final void Function() onPressed;
  final String lable;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        textColor: Colors.white,
        child: Text(
          lable,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
