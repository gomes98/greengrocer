import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/product/product_screen.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;
  ItemTile({Key? key, required this.item}) : super(key: key);
  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (c) {
                  return ProductScreen(item: item);
                },
              ),
            );
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    // faz com que a imagem tenha uma animação de transição
                    child: Hero(
                      tag: item.imgUrl,
                      child: Image.asset(item.imgUrl),
                    ),
                  ),
                  Text(
                    item.itemName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customSwatchColor),
                      ),
                      Text(
                        " / ${item.unit}",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        // adicionar ao carrinho
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            height: 40,
            width: 35,
            decoration: BoxDecoration(
              color: CustomColors.customSwatchColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topRight: Radius.circular(20),
              ),
            ),
            child: const Icon(
              Icons.add_shopping_cart_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
