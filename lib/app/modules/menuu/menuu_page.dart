import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:loginsys/app/modules/menuu/widgets/product_tile.dart';
import './menuu_controller.dart';

class MenuuPage extends GetView<MenuuController> {
  const MenuuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RefreshIndicator(
        onRefresh: controller.refreshPage,
        child: ListView.builder(
          itemCount: controller.menu.length,
          itemBuilder: (context, index) {
            final prod = controller.menu[index];
            return ProductTile(product: prod);
          },
        ),
      );
    });
  }
}
