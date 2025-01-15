import 'package:flutter/material.dart';

class LoginsysAppbar extends AppBar {
  LoginsysAppbar({
    super.key,
    double elevation = 2,
  }) : super(
          backgroundColor: Colors.white,
          elevation: elevation,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            width: 50,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        );
}
