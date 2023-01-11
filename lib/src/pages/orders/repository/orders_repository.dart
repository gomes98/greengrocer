import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
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

  Future<OrdersResult<List<CartItemModel>>> getOrderItems({
    required String token,
    required String orderId,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.getOrderItems,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {
        'orderId': orderId,
      },
    );

    if (result['result'] != null) {
      List<CartItemModel> items =
          List<Map<String, dynamic>>.from(result['result'])
              .map((e) => CartItemModel.fromMap(e))
              .toList();
      return OrdersResult<List<CartItemModel>>.success(items);
    } else {
      // return CartResult.error("ocorreu um erro ao recuperar itens do carrinho");
      return OrdersResult<List<CartItemModel>>.error(
          "ocorreu um erro ao recuperar os prudutos do pedido");
    }
  }
}
