import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  Future<HomeResult<CategoryModel>> getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: EndPoints.getAllCategories,
      method: HttpMethods.post,
    );

    if (result['result'] != null) {
      // convertendo em um formato legivel para humanos
      List data = result['result'];
      List<CategoryModel> list = [];
      for (var element in data) {
        list.add(CategoryModel.fromMap(element));
      }

      return HomeResult<CategoryModel>.success(list);
    } else {
      return HomeResult.error(
        "Ocorreu um erro inisperado a recuperar as categorias",
      );
    }
  }

  Future<HomeResult<ItemModel>> getAllProducts(
      Map<String, dynamic> body) async {
    final result = await _httpManager.restRequest(
        url: EndPoints.getAllProducts, method: HttpMethods.post, body: body);

    if (result['result'] != null) {
      // convertendo do formato do professor, porem acredito não ser muito legivel
      List<ItemModel> data = (List<Map<String, dynamic>>.from(result['result']))
          .map((e) => ItemModel.fromMap(e))
          .toList();
      return HomeResult<ItemModel>.success(data);
    } else {
      return HomeResult.error(
        "Ocorreu um erro inisperado a recuperar os produtos",
      );
    }
  }
}
