import 'package:injectable/injectable.dart';
import 'package:sales_beeorder_app/consts/urls.dart';
import 'package:sales_beeorder_app/module_auth/request/login_request/login_request.dart';
import 'package:sales_beeorder_app/module_auth/response/login_response/login_response.dart';
import 'package:sales_beeorder_app/module_network/http_client/http_client.dart';
import 'package:sales_beeorder_app/utils/logger/logger.dart';

@injectable
class AuthRepository {
  final ApiClient _apiClient;
  final Logger _logger;
  AuthRepository(this._apiClient, this._logger);

  Future<LoginResponse?> getToken(LoginRequest loginRequest) async {
    var result = await _apiClient.post(
      Urls.CREATE_TOKEN_API,
      loginRequest.toJson(),
    );
    if (result == null) {
      return null;
    }
    return LoginResponse.fromJson(result);
  }
}
