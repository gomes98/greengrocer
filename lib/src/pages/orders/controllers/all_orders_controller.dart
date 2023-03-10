import 'package:get/get.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/orders/order_result/orders_result.dart';
import 'package:greengrocer/src/pages/orders/repository/orders_repository.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class AllOrdersController extends GetxController {
  List<OrderModel> allOrders = [];

  final ordersRepository = OrdersRepository();

  final authController = Get.find<AuthController>();

  final utilsServices = UtilsServices();

  @override
  void onInit() {
    super.onInit();

    getAllOrders();
  }

  Future<void> getAllOrders() async {
    OrdersResult<List<OrderModel>> result = await ordersRepository.getAllOrders(
      token: authController.user.token!,
      userId: authController.user.id!,
    );
    result.when(success: (orders) {
      allOrders = orders
        ..sort(
          (a, b) => b.createdOrderTime!.compareTo(a.createdOrderTime!),
        );
      update();
    }, error: (message) {
      utilsServices.showToast(
        message: message,
      );
    });
  }
}
