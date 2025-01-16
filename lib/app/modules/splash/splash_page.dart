import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsys/app/core/ui/widgets/loginsys_button.dart';
import 'package:loginsys/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: context.heightTransformer(reducedBy: 85),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    scale: 2,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  LoginsysButton(
                    label: 'ACESSAR',
                    width: context.widthTransformer(reducedBy: 20),
                    height: 60,
                    onPressed: () => controller.checkLogged(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
