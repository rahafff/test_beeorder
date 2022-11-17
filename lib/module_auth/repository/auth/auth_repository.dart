import 'package:sales_beeorder_app/abstracts/response/action_response.dart';
import 'package:sales_beeorder_app/consts/urls.dart';
import 'package:sales_beeorder_app/di/di_config.dart';
import 'package:sales_beeorder_app/module_auth/request/login_request/login_request.dart';
import 'package:sales_beeorder_app/module_auth/request/register_request/register_request.dart';
import 'package:sales_beeorder_app/module_localization/service/localization_service/localization_service.dart';
import 'package:sales_beeorder_app/module_network/http_client/http_client.dart';
import 'package:sales_beeorder_app/utils/logger/logger.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRepository {
  final ApiClient _apiClient;
  final Logger _logger;
  AuthRepository(this._apiClient, this._logger);


  Future<WebServiceResponse?> getToken(LoginRequest loginRequest) async {
    WebServiceResponse? result = await _apiClient.post(
      Urls.LOGIN,
      loginRequest.toJson(),
        jsonDataType : true,
        headers: {'lang':getIt<LocalizationService>().getLanguage()}
    );
    if (result == null) {
      return null;
    }
    return result;
  }
  Future<WebServiceResponse?> registerClient(RegisterRequest request) async {
    WebServiceResponse? result = await _apiClient.post(
      Urls.SIGNUP,
      request.toJson(),
        jsonDataType : true,
        headers: {'lang':getIt<LocalizationService>().getLanguage()}
    );
    if (result == null) {
      return null;
    }
    return result;
  }

}
