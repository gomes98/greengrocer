import 'package:get/get.dart';
import 'package:greengrocer/src/pages/orders/controllers/all_orders_controller.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AllOrdersController());
  }
}