import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/home/repository/home_repository.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/utils_services.dart';

const int itemsPerPage = 6;

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilsServices = UtilsServices();

  bool isCategoryLoading = false;
  bool isProductLoading = true;

  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;
  List<ItemModel> get allProducts => currentCategory?.items ?? [];
  bool get isLastPage {
    // se a lista de prudutos é menor que os itens por pagina ja estou na ultima pagina
    if (currentCategory!.items.length < itemsPerPage) return true;
    // se a paginação da categoria multitplicada pelos item por pagina for maior que todos os produtos tambem estamos no final
    return (currentCategory!.pagination * itemsPerPage) > allProducts.length;
  }

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  void setLoading(bool value, {bool isProduct = false}) {
    if (!isProduct) {
      isCategoryLoading = value;
    } else {
      isProductLoading = value;
    }
    update();
  }

  void selectCategory(CategoryModel c) {
    currentCategory = c;
    update();

    if (currentCategory!.items.isNotEmpty) return;

    getAllProducts();
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

  void loadMoreProducts() {
    currentCategory!.pagination++;

    getAllProducts(canLoad: false);
  }

  Future<void> getAllProducts({bool canLoad = true}) async {
    if (canLoad) {
      setLoading(true, isProduct: true);
    }

    Map<String, dynamic> body = {
      "page": currentCategory!.pagination,
      "categoryId": currentCategory!.id,
      "itemsPerPage": itemsPerPage
    };

    HomeResult<ItemModel> homeResult =
        await homeRepository.getAllProducts(body);

    setLoading(false, isProduct: true);

    homeResult.when(success: (data) {
      // allProducts.addAll(data);
      currentCategory!.items.addAll(data);
      // print(allProducts);
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }
}
