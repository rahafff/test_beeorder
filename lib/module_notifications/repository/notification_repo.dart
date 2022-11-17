import 'package:injectable/injectable.dart';
import 'package:sales_beeorder_app/module_auth/service/auth_service/auth_service.dart';
import 'package:sales_beeorder_app/module_network/http_client/http_client.dart';

@injectable
class NotificationRepo {
  final ApiClient _apiClient;
  final AuthService _authService;

  NotificationRepo(this._apiClient, this._authService);

  void postToken(String? token) {
    _authService.getToken().then(
      (value) {
        if (value != null) {
          // var sound =
          //     NotificationsPrefHelper().getNotification().split('/').last;
          // _apiClient.post(Urls.NOTIFICATION_API,
          //     {'token': token.toString(), 'sound': sound},
          //     headers: {'Authorization': 'Bearer ${value}'});
        }
      },
    );
  }
}
