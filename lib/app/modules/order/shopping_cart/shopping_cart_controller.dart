import 'package:get/get.dart';
import 'package:loginsys/app/core/services/auth_service.dart';
import 'package:loginsys/app/core/services/shopping_cart_service.dart';
import 'package:loginsys/app/models/order.dart';
import 'package:loginsys/app/models/shopping_cart_model.dart';
import 'package:loginsys/app/modules/home/home_controller.dart';
import 'package:loginsys/app/repositories/order/order_repository.dart';

class ShoppingCartController extends GetxController {
  final AuthService _authService;
  final ShoppingCartService _shoppingCartService;
  final OrderRepository _orderRepository;

  final _address = ''.obs;
  final _cpf = ''.obs;

  ShoppingCartController({
    required AuthService authService,
    required ShoppingCartService shoppingCartService,
    required OrderRepository orderRepository,
  })  : _authService = authService,
        _shoppingCartService = shoppingCartService,
        _orderRepository = orderRepository;

  List<ShoppingCartModel> get products => _shoppingCartService.products;

  double get totalValue => _shoppingCartService.totalValue;

  set address(String address) => _address.value = address;
  set cpf(String cpf) => _cpf.value = cpf;

  void addQuantityInProduct(ShoppingCartModel shoppingCartModel) {
    _shoppingCartService.addAndRemoveProductInShoppingCard(
        shoppingCartModel.product,
        quantity: shoppingCartModel.quantity + 1);
  }

  void subtractQuantityInProduct(ShoppingCartModel shoppingCartModel) {
    _shoppingCartService.addAndRemoveProductInShoppingCard(
        shoppingCartModel.product,
        quantity: shoppingCartModel.quantity - 1);
  }

  void clear() => _shoppingCartService.clear();

  Future<void> createOrder() async {
    final userId = _authService.getUserId();
    final order = Order(
      userId: userId!,
      cpf: _cpf.value,
      address: _address.value,
      items: products,
    );
    var orderPix = await _orderRepository.createOrder(order);
    orderPix = orderPix.copyWith(totalValue: totalValue);

    Get.offNamed('/orders/finished', arguments: orderPix);
    Get.back(id: HomeController.NAVIGATOR_KEY);
  }
}
