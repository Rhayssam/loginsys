import 'package:get/get.dart';
import 'package:loginsys/app/core/rest_client/rest_client.dart';
import 'package:loginsys/app/core/services/shopping_cart_service.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
    Get.lazyPut(() => ShoppingCartService());
  }
}
