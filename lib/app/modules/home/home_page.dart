import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:loginsys/app/core/services/auth_service.dart';
import 'package:loginsys/app/core/ui/widgets/loginsys_appbar.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginsysAppbar(),
      body: Center(
        child: TextButton(
            onPressed: () {
              Get.find<AuthService>().logout();
            },
            child: const Text('LOGOUT')),
      ),
    );
  }
}
