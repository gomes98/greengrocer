import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/common_widgets/quantity_widget.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;
  const CartTile({Key? key, required this.cartItem, required this.remove})
      : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
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
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle:
            Text(utilsServices.priceToCurrency(widget.cartItem.totalPrice())),
        // quantidade
        trailing: QuantityWidget(
          sulffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (a) {
            setState(() {
              widget.cartItem.quantity = a;
            });
            if (a == 0) {
              widget.remove(widget.cartItem);
            }
          },
          isRemovable: true,
        ),
        onTap: () {
          Navigator.of(context).pushNamed('/cart');
        },
      ),
    );
  }
}
