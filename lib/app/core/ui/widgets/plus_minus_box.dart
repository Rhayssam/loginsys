// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:loginsys/app/core/ui/formatter_helper.dart';
import 'package:loginsys/app/core/ui/widgets/loginsys_rounded_button.dart';

class PlusMinusBox extends StatelessWidget {
  final bool elevated;
  final Color? backgroundColor;
  final String? label;
  final int quantity;
  final double price;
  final VoidCallback minusCallback;
  final VoidCallback plusCallback;
  final bool calculateTotal;

  const PlusMinusBox({
    super.key,
    required this.quantity,
    required this.price,
    required this.minusCallback,
    required this.plusCallback,
    this.elevated = false,
    this.backgroundColor,
    this.label,
    this.calculateTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevated ? 5 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: label != null,
              child: Text(
                label ?? '',
                style: const TextStyle(fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                LoginsysRoundedButton(
                  onpressed: minusCallback,
                  label: '-',
                ),
                Text('$quantity'),
                LoginsysRoundedButton(
                  onpressed: plusCallback,
                  label: '+',
                ),
              ],
            ),
            Visibility(
              visible: label == null,
              child: const Spacer(),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 10),
              constraints: const BoxConstraints(minWidth: 70),
              child: Text(
                FormatterHelper.formatCurrency(
                  calculateTotal ? price * quantity : price,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
