import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_error.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();
  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.signin,
      method: HttpMethods.post,
      body: {"email": email, "password": password},
    );

    return handleUserOrError(result);
  }

  Future<AuthResult> validateToken({required String token}) async {
    final result = await _httpManager.restRequest(
        url: EndPoints.validateToken,
        method: HttpMethods.post,
        headers: {'X-Parse-Session-Token': token});

    return handleUserOrError(result);
  }

  Future<AuthResult> signUp(UserModel user) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.signup,
      method: HttpMethods.post,
      body: user.toMap(),
    );

    return handleUserOrError(result);
  }

  Future<void> resetPassword(String email) async {
    await _httpManager.restRequest(
      url: EndPoints.resetPassword,
      method: HttpMethods.post,
      body: {'email': email},
    );
  }

  Future<bool> changePassword({
    required String email,
    required String currentPassword,
    required String newPassword,
    required String token,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.changePassword,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {
        'email': email,
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      },
    );

    return result['error'] != null;
  }

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final user = UserModel.fromMap(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrorString(result['error']));
    }
  }
}
