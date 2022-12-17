import 'package:sales_beeorder_app/abstracts/response/action_response.dart';
import 'package:sales_beeorder_app/consts/urls.dart';
import 'package:sales_beeorder_app/module_auth/service/auth_service/auth_service.dart';
import 'package:sales_beeorder_app/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class RestaurantRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  RestaurantRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getAllOrder() async {
    var token = await _authService.getToken();
    dynamic  response = await _apiClient.get(
      Urls.GET_RESTAURANT,
        headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return WebServiceResponse.fromJson(response);
  }

  Future<WebServiceResponse?> changeOrderState(
     String id,String stateId) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
      Urls.CHANGE_ORDER_STATUS + '${id}' + '/'+ '${stateId}',
      {},
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return WebServiceResponse.fromJson(response);
  }
  Future<WebServiceResponse?> getStoreProfile() async {
    var token = await _authService.getToken();
    dynamic  response = await _apiClient.get(
      Urls.STORE_PROFILE,
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return WebServiceResponse.fromJson(response);
  }
}
