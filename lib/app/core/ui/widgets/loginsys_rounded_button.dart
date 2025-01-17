import 'package:flutter/material.dart';

class LoginsysRoundedButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String label;
  final double fontSize;

  const LoginsysRoundedButton({
    super.key,
    required this.onpressed,
    required this.label,
    this.fontSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), backgroundColor: Colors.white),
      onPressed: onpressed,
      child: Text(
        label,
        style: TextStyle(color: Colors.grey, fontSize: fontSize),
      ),
    );
  }
}
