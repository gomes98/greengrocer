import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/cart/cart_result/cart_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class CartRepository {
  final _httpManager = HttpManager();

  Future<CartResult<List<CartItemModel>>> getCartItems({
    required String token,
    required String userId,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.getCartItems,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {'user': userId},
    );

    if (result['result'] != null) {
      // print(result['result']);
      List<CartItemModel> data =
          List<Map<String, dynamic>>.from(result['result'])
              .map((e) => CartItemModel.fromMap(e))
              .toList();
      return CartResult<List<CartItemModel>>.success(data);
    } else {
      return CartResult.error("ocorreu um erro ao recuperar itens do carrinho");
    }
  }
}
