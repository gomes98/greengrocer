import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/orders/order_result/orders_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class OrdersRepository {
  final _httpManager = HttpManager();

  Future<OrdersResult<List<OrderModel>>> getAllOrders({
    required String token,
    required String userId,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.getAllOrders,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {
        'user': userId,
      },
    );

    if (result['result'] != null) {
      List<OrderModel> orders =
          List<Map<String, dynamic>>.from(result['result'])
              .map((e) => OrderModel.fromMap(e))
              .toList();
      return OrdersResult<List<OrderModel>>.success(orders);
    } else {
      // return CartResult.error("ocorreu um erro ao recuperar itens do carrinho");
      return OrdersResult<List<OrderModel>>.error(
          "ocorreu um erro ao recuperar os pedidos");
    }
  }
}
