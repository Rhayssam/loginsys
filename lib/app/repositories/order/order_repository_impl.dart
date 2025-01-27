import 'dart:developer';

import 'package:loginsys/app/core/rest_client/rest_client.dart';
import 'package:loginsys/app/models/order.dart';

import 'package:loginsys/app/models/order_pix.dart';
import 'package:loginsys/app/repositories/order/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final RestClient _restClient;

  OrderRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<OrderPix> createOrder(Order order) async {
    final result = await _restClient.post('/order', {
      'userId': order.userId,
      'cpf': order.cpf,
      'address': order.address,
      'items': order.items
          .map((shoppingCart) => {
                'quantity': shoppingCart.quantity,
                'productId': shoppingCart.product.id
              })
          .toList()
    });

    if (result.hasError) {
      log(
        'Erro ao realizar pedido ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao realizar pedido');
    }
    return OrderPix.fromMap(result.body);
  }
}
