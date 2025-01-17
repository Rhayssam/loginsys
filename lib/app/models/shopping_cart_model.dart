// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:loginsys/app/models/product_model.dart';

class ShoppingCartModel {
  int quantity;
  ProductModel product;
  ShoppingCartModel({
    required this.quantity,
    required this.product,
  });
}
