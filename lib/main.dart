import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loginsys/app/core/bindings/application_binding.dart';
import 'package:loginsys/app/core/ui/loginsys_ui.dart';
import 'package:loginsys/app/routes/auth_routers.dart';
import 'package:loginsys/app/routes/home_routers.dart';
import 'package:loginsys/app/routes/splash_routers.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const LoginSysMainApp());
}

class LoginSysMainApp extends StatelessWidget {
  const LoginSysMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'LoginSys',
      theme: LoginsysUI.theme,
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
      ],
    );
  }
}
