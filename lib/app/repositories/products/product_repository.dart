import 'package:loginsys/app/models/product_model.dart';

abstract interface class ProductRepository {
  Future<List<ProductModel>> findAll();
}
