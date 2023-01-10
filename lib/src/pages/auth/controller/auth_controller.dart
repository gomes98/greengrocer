import 'package:get/get.dart';
import 'package:greengrocer/src/constants/storage_keys.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/pages_routes/app_routes.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilServices = UtilsServices();
  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(success: (user) {
      this.user = user;
      // salvo o token
      utilServices.saveLocalData(
        key: StorageKeys.token,
        value: this.user.token!,
      );
      // limpa todas as telas da pilha
      Get.offAllNamed(PagesRoutes.baseRoute);
    }, error: (message) {
      utilServices.showToast(message: message, isError: true);
    });
  }

  Future<void> signUp() async {
    isLoading.value = true;

    AuthResult result = await authRepository.signUp(user);

    isLoading.value = false;

    result.when(success: (user) {
      this.user = user;
      // salvo o token
      utilServices.saveLocalData(
        key: StorageKeys.token,
        value: this.user.token!,
      );
      // limpa todas as telas da pilha
      Get.offAllNamed(PagesRoutes.baseRoute);
    }, error: (message) {
      utilServices.showToast(message: message, isError: true);
    });
  }

  Future<void> resetPassword(String email) async {
    await authRepository.resetPassword(email);
  }

  Future<void> validateToken() async {
    // await Future.delayed(const Duration(seconds: 2));
    // Get.offAllNamed(PagesRoutes.signInRoute);
    // return;
    String? token = await utilServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    isLoading.value = true;

    AuthResult result = await authRepository.validateToken(token: token);

    isLoading.value = false;

    result.when(success: (user) {
      this.user = user;
      // limpa todas as telas da pilha
      Get.offAllNamed(PagesRoutes.baseRoute);
    }, error: (message) {
      signOut();
    });
  }

  Future<void> signOut() async {
    // limpando o usuário
    user = UserModel();
    // limpando o token
    await utilServices.removeLocalData(key: StorageKeys.token);
    // volta para o login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }
}
