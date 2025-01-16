import 'package:get/get.dart';
import 'package:loginsys/app/repositories/products/product_repository.dart';
import 'package:loginsys/app/repositories/products/product_repository_impl.dart';
import './menuu_controller.dart';

class MenuuBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(
        () => ProductRepositoryImpl(restClient: Get.find()));
    Get.put(MenuuController(productRepository: Get.find()));
  }
}
