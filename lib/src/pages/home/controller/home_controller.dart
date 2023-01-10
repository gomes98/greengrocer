import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/pages/home/repository/home_repository.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilsServices = UtilsServices();

  bool isLoading = false;

  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  void selectCategory(CategoryModel c) {
    currentCategory = c;
    update();
  }

  Future<void> getAllCategories() async {
    setLoading(true);

    HomeResult<CategoryModel> homeResult =
        await homeRepository.getAllCategories();

    setLoading(false);

    homeResult.when(success: (data) {
      allCategories.addAll(data);
      if (allCategories.isEmpty) return;
      selectCategory(allCategories.first);
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }
}
