import 'package:sales_beeorder_app/utils/logger/logger.dart';

class LoginResponse {
  LoginResponse({
    this.token,
  });

  String? token;


  LoginResponse.fromJson(Map<String, dynamic> json) {
    try {
      token = json["token"];
    } catch (e) {
      Logger().error('Auth login Response', e.toString(), StackTrace.current);
    }
  }
}

