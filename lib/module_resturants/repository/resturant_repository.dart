import 'package:sales_beeorder_app/abstracts/response/action_response.dart';
import 'package:sales_beeorder_app/consts/urls.dart';
import 'package:sales_beeorder_app/module_auth/service/auth_service/auth_service.dart';
import 'package:sales_beeorder_app/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';
import 'package:sales_beeorder_app/module_resturants/request/create_restaurant_request.dart';

@injectable
class RestaurantRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  RestaurantRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getRestaurant() async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_RESTAURANT,
      headers: {'device_id':'$token'},
      queryParams: {'format':'json'}
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> addNewRestaurant(
      CreateRestaurantRequest request) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.ADD_RESTAURANT,
      request.toJson(),
      headers: {'device_id':'$token'},
      jsonDataType: true
    );
    if (response == null) return null;
    return response;
  }

}
