import 'package:flutter/material.dart';
import 'package:loginsys/app/core/ui/formatter_helper.dart';
import 'package:loginsys/app/core/ui/loginsys_ui.dart';
import 'package:loginsys/app/models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  const ProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: [
            Container(
              width: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    product.name,
                    style: LoginsysUI.textBold,
                  ),
                  Text(FormatterHelper.formatCurrency(product.price)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
