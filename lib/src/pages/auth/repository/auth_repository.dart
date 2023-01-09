import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();
  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.signin,
      method: HttpMethods.post,
      body: {"email": email, "password": password},
    );

    if (result['result'] != null) {
      print("Sigin Funcionou");
    } else {
      print("Sigin não Funcionou");
    }
  }
}
