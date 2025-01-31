import 'package:get/get.dart';
import 'package:loginsys/app/modules/product_detail/product_detail_bindings.dart';
import 'package:loginsys/app/modules/product_detail/product_detail_page.dart';

class ProductRouters {
  ProductRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/product_detail',
      binding: ProductDetailBindings(),
      page: () => const ProductDetailPage(),
    ),
  ];
}
