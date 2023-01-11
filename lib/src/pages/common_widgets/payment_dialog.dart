import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel orderModel;
  PaymentDialog({Key? key, required this.orderModel}) : super(key: key);
  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // conteudo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // titulo
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Pagamento com Pix",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                // qr code
                Image.memory(
                  utilsServices.decodeQRCodeImage(orderModel.qrcodeImage),
                  height: 200,
                  width: 200,
                ),
                // QrImage(
                //   data: "1234567890",
                //   version: QrVersions.auto,
                //   size: 200.0,
                // ),
                // vencimento
                Text(
                  "Vencimento: ${utilsServices.formatDateTime(orderModel.overdueDateTime)}",
                  style: const TextStyle(fontSize: 12),
                ),
                // total
                Text(
                  "Total: ${utilsServices.priceToCurrency(orderModel.total)}",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // botão copia e cola
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {
                    FlutterClipboard.copy(orderModel.copyAndPaste);
                    utilsServices.showToast(message: "Código copiado");
                  },
                  icon: const Icon(
                    Icons.copy,
                    size: 15,
                  ),
                  label: const Text(
                    "Copiar código Pix",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          // botão de fechar
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
