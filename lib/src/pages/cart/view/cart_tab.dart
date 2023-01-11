import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/cart/controller/cart_controller.dart';
import 'package:greengrocer/src/pages/cart/view/components/cart_tile.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          // lista de itens
          Expanded(child: GetBuilder<CartController>(
            builder: (controller) {
              if (controller.cartItems.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.remove_shopping_cart,
                      size: 40,
                      color: CustomColors.customSwatchColor,
                    ),
                    const Text("Não há itens no carrinho"),
                  ],
                );
              } else {
                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (_, index) {
                    return CartTile(
                      cartItem: controller.cartItems[index],
                      // remove: removeItemFromCart,
                    );
                  },
                );
              }
            },
          )),

          // finalizar compra
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
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
                const Text(
                  'Total Geral',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GetBuilder<CartController>(
                  builder: (controller) {
                    return Text(
                      utilsServices.priceToCurrency(
                        controller.cartTotalPrice(),
                      ),
                      style: TextStyle(
                        color: CustomColors.customSwatchColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                  child: GetBuilder<CartController>(
                    builder: (controller) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: CustomColors.customSwatchColor,
                          // onPrimary: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                        ),
                        onPressed: (controller.isCheckoutLoading ||
                                controller.cartItems.isEmpty)
                            ? null
                            : () async {
                                bool? result = await showOrderConfirmation();
                                if (result ?? false) {
                                  cartController.checkout();
                                } else {
                                  utilsServices.showToast(
                                    message: "Pedido não confirmado",
                                  );
                                }
                              },
                        child: controller.isCheckoutLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                                'Finalizar Compra',
                                style: TextStyle(fontSize: 18),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text('Confirmação de Pedido'),
            content: const Text('Deseja realmente concluir o pedido?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Não'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Sim'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ],
          );
        });
  }
}
