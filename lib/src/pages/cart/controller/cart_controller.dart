import 'package:get/get.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/cart/cart_result/cart_result.dart';
import 'package:greengrocer/src/pages/cart/repository/cart_repository.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();

  final authController = Get.find<AuthController>();

  final utilsServices = UtilsServices();

  List<CartItemModel> cartItems = [];

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  Future<bool> changeItemQuantity({
    required CartItemModel item,
    required int quantity,
  }) async {
    final result = await cartRepository.changeItemQuantity(
      token: authController.user.token!,
      cartItemId: item.id,
      quantity: quantity,
    );
    return result;
  }

  Future<void> getCartItems() async {
    final CartResult<List<CartItemModel>> result =
        await cartRepository.getCartItems(
      token: authController.user.token!,
      userId: authController.user.id!,
    );

    result.when(success: (data) {
      cartItems = data;
      update();
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }

  int getItemIndex(ItemModel item) {
    return cartItems.indexWhere((itemInList) => itemInList.item.id == item.id);
  }

  Future<void> addItemToCart({
    required ItemModel item,
    int quantity = 1,
  }) async {
    int itemIndex = getItemIndex(item);

    if (itemIndex >= 0) {
      // pegando o item do carrinho
      final product = cartItems[itemIndex];
      // altero no back
      final result = await changeItemQuantity(
        item: product,
        quantity: product.quantity + quantity,
      );

      if (result) {
      } else {
        utilsServices.showToast(
          message: "Ocorreu um erro a alterar a quantidade carrinho",
          isError: true,
        );
      }
      // ja existe no carrinho
      cartItems[itemIndex].quantity += quantity;
    } else {
      final CartResult<String> result = await cartRepository.addItemToCart(
        token: authController.user.token!,
        userId: authController.user.id!,
        productId: item.id,
        quantity: quantity,
      );

      result.when(
        success: (cartItemId) {
          // :não existe no carrinho
          cartItems.add(
            CartItemModel(
              item: item,
              id: cartItemId,
              quantity: quantity,
            ),
          );
        },
        error: (message) {
          utilsServices.showToast(message: message, isError: true);
        },
      );
    }

    update();
    // final CartResult<List<CartItemModel>> result =
    //     await cartRepository.getCartItems(
    //   token: authController.user.token!,
    //   userId: authController.user.id!,
    // );

    // result.when(success: (data) {
    //   cartItems = data;
    //   update();
    // }, error: (message) {
    //   utilsServices.showToast(message: message, isError: true);
    // });
  }
}
