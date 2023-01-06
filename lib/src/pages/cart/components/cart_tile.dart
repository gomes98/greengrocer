import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/common_widgets/quantity_widget.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItem;
  CartTile({Key? key, required this.cartItem}) : super(key: key);
  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Image.asset(
          cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(utilsServices.priceToCurrency(cartItem.totalPrice())),
        trailing: QuantityWidget(
            sulffixText: cartItem.item.unit,
            value: cartItem.quantity,
            result: (a) {}),
        onTap: () {
          Navigator.of(context).pushNamed('/cart');
        },
      ),
    );
  }
}
