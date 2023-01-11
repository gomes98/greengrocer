import 'package:get/get.dart';
import 'package:greengrocer/src/pages/cart/controller/cart_controller.dart';

class CartBindind extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
