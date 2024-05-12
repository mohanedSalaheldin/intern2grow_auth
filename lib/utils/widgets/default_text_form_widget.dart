import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DefaultTextFormField extends StatefulWidget {
  const DefaultTextFormField({
    super.key,
    required this.controller,
    required this.lable,
    this.isPassword = false,
    this.isEditable = true,
    this.iconData,
    // this.onSuffixPressed,
  });
  final TextEditingController controller;
  final String lable;
  final bool? isPassword;
  final bool? isEditable;
  final IconData? iconData;
  // final void Function()? onSuffixPressed;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  bool isTextVisble = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lable,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(5),
        TextFormField(
          controller: widget.controller,
          enabled: widget.isEditable!,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
          obscureText: widget.isPassword! && isTextVisble,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(widget.iconData),
              onPressed: () {
                if (widget.isPassword!) {
                  setState(() {
                    isTextVisble = !isTextVisble;
                  });
                } else {
                  widget.controller.text = '';
                }
              },
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
