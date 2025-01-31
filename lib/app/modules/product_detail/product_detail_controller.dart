// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:get/get.dart';

import 'package:loginsys/app/core/services/shopping_cart_service.dart';
import 'package:loginsys/app/models/product_model.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final _totalPrice = 0.0.obs;
  final _quantity = 1.obs;
  final ShoppingCartService _shoppingCartService;
  final _alreadyAdded = false.obs;

  ProductDetailController({required ShoppingCartService shoppingCartService})
      : _shoppingCartService = shoppingCartService;

  ProductModel get product => _product.value;
  double get totalPrice => _totalPrice.value;
  int get quantity => _quantity.value;
  bool get alreadyAdded => _alreadyAdded.value;

  @override
  void onInit() {
    super.onInit();
    _totalPrice(product.price);

    ever<int>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);
    });
    final productShoppingCart = _shoppingCartService.getById(product.id);
    if (productShoppingCart != null) {
      _quantity(productShoppingCart.quantity);
      _alreadyAdded(true);
    }
  }

  void addProduct() {
    _quantity.value += 1;
  }

  void removeProduct() {
    if (_quantity > 1) {
      _quantity.value -= 1;
    }
  }

  void addProductInShoppingCart() {
    _shoppingCartService.addAndRemoveProductInShoppingCard(product,
        quantity: quantity);
    log('Adicionado ao carrinho');
    Get.back();
  }
}
