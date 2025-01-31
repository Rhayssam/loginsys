import 'package:get/get.dart';
import 'package:loginsys/app/modules/order/finished/finished_page.dart';
import 'package:loginsys/app/modules/order/pix/pix_page.dart';

class OrdersRouters {
  OrdersRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/orders/finished',
      page: () => FinishedPage(),
    ),
    GetPage(
      name: '/orders/pix',
      page: () => PixPage(),
    ),
  ];
}
