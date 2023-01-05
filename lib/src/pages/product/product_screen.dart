import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class ProductScreen extends StatelessWidget {
  final ItemModel item;
  ProductScreen({Key? key, required this.item}) : super(key: key);
  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          // conteudo
          Column(
            children: [
              Expanded(
                // faz com que a imagem tenha uma animação de transição
                child: Hero(
                  tag: item.imgUrl,
                  child: Image.asset(item.imgUrl),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 70,
                            color: Colors.red,
                          )
                        ],
                      ),
                      // preco
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: TextStyle(
                          color: CustomColors.customSwatchColor,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Desscrição
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              item.description * 20,
                              style: const TextStyle(
                                // fontSize: 16,
                                // color: Colors.grey,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //

                      SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: (() {}),
                          label: const Text('Add no Carrinho'),
                          icon: const Icon(Icons.shopping_cart_outlined),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          // botão de voltar
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}