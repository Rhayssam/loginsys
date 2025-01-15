import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class LoginsysTextformfield extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  final Icon icon;

  const LoginsysTextformfield({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.onChange,
    this.obscureText = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChange,
      cursorColor: context.theme.primaryColor,
      decoration: InputDecoration(
        hintText: label,
        errorStyle: const TextStyle(color: Colors.redAccent),
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: context.theme.primaryColor.withOpacity(0.1),
        prefixIcon: icon,
        prefixIconColor: context.theme.primaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
