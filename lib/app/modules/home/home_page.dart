import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:loginsys/app/core/ui/widgets/icon_badge.dart';
import 'package:loginsys/app/core/ui/widgets/loginsys_appbar.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginsysAppbar(),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (value) => controller.tabIndex = value,
          currentIndex: controller.tabIndex,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Produtos',
            ),
            BottomNavigationBarItem(
              icon: IconBadge(
                icon: Icons.shopping_cart,
                number: controller.totalProductsInShoppingCart,
              ),
              label: 'Carrinho',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Sair',
            ),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGeneratedRouter,
      ),
      // body: Center(
      //   child: TextButton(
      //       onPressed: () {
      //         Get.find<AuthService>().logout();
      //       },
      //       child: const Text('LOGOUT')),
      // ),
    );
  }
}
