import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:loginsys/app/core/services/auth_service.dart';
import 'package:loginsys/app/core/services/shopping_cart_service.dart';
import 'package:loginsys/app/modules/menuu/menuu_bindings.dart';
import 'package:loginsys/app/modules/menuu/menuu_page.dart';
import 'package:loginsys/app/modules/order/shopping_cart/shopping_cart_bindings.dart';
import 'package:loginsys/app/modules/order/shopping_cart/shopping_cart_page.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  final ShoppingCartService _shoppingCartService;
  final _tabIndex = 0.obs;
  final _tabs = ['/menu', '/order/shopping_cart', '/exit'];

  HomeController({required ShoppingCartService shoppingCartService})
      : _shoppingCartService = shoppingCartService;

  int get tabIndex => _tabIndex.value;

  int get totalProductsInShoppingCart => _shoppingCartService.totalProducts;

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRouter(RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
        settings: settings,
        page: () => const MenuuPage(),
        binding: MenuuBindings(),
        transition: Transition.fadeIn,
      );
    }
    if (settings.name == '/order/shopping_cart') {
      return GetPageRoute(
        settings: settings,
        page: () => ShoppingCartPage(),
        binding: ShoppingCartBindings(),
        transition: Transition.fadeIn,
      );
    }
    return null;
  }
}
