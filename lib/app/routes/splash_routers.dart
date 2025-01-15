import 'package:get/get.dart';
import 'package:loginsys/app/modules/splash/splash_bindings.dart';
import 'package:loginsys/app/modules/splash/splash_page.dart';

class SplashRouters {
  SplashRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/',
      binding: SplashBindings(),
      page: () => const SplashPage(),
    )
  ];
}
