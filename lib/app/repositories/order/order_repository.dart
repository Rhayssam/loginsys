import 'package:loginsys/app/models/order.dart';
import 'package:loginsys/app/models/order_pix.dart';

abstract interface class OrderRepository {
  Future<OrderPix> createOrder(Order order);
}
