import 'package:injectable/injectable.dart';
import 'package:sales_beeorder_app/module_auth/repository/auth/auth_repository.dart';
import 'package:sales_beeorder_app/module_auth/request/login_request/login_request.dart';
import 'package:sales_beeorder_app/module_auth/response/login_response/login_response.dart';

@injectable
class AuthManager {
  final AuthRepository _authRepository;
  AuthManager(this._authRepository);



  Future<LoginResponse?> login(LoginRequest loginRequest) =>
      _authRepository.getToken(loginRequest);



}
