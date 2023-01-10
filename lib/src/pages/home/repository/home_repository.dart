import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();
  getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: EndPoints.getAllCategories,
      method: HttpMethods.post,
    );

    if (result['result'] != null) {
      List data = result['result'];
      List<CategoryModel> list = [];
      for (var element in data) {
        list.add(CategoryModel.fromMap(element));
      }

      return HomeResult<CategoryModel>.success(list);
      // List<CategoryModel> data =
      //     (List<Map<String, dynamic>>.from(result['result']))
      //         .map((e) => CategoryModel.fromMap(e))
      //         .toList();
      // return HomeResult<CategoryModel>.success(data);
    } else {
      return HomeResult.error(
        "Ocorreu um erro inisperado a recuperar as categorias",
      );
    }
  }
}
