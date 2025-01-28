import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginsys/app/core/ui/formatter_helper.dart';
import 'package:loginsys/app/core/ui/widgets/loginsys_appbar.dart';
import 'package:get/get.dart';
import 'package:loginsys/app/models/order_pix.dart';

class PixPage extends StatelessWidget {
  final OrderPix _orderPix = Get.arguments;

  PixPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var qrCode = Uri.parse(_orderPix.image).data;
    return Scaffold(
      appBar: LoginsysAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                Text(
                  'Valor a pagar',
                  style: context.textTheme.headlineLarge,
                ),
                Text(
                  // FormatterHelper.formatCurrency(200),
                  FormatterHelper.formatCurrency(_orderPix.totalValue),
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.theme.primaryColorDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Image.memory(
                //   qrCode!.contentAsBytes(),
                //   width: context.widthTransformer(reducedBy: 50),
                //   height: context.heightTransformer(reducedBy: 50),
                // ),
                const SizedBox(
                  height: 50,
                ),
                const Text('Chave de Telefone'),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _orderPix.code));
                    Get.rawSnackbar(
                      message: 'Código PIX copiado',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  child: Text(
                    'PIX Copia e Cola',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontSize: 30,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
