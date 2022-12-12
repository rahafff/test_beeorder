
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_auth/enums/auth_status.dart';
import 'package:sales_beeorder_app/module_auth/exceptions/auth_exception.dart';
import 'package:sales_beeorder_app/module_auth/manager/auth_manager/auth_manager.dart';
import 'package:sales_beeorder_app/module_auth/presistance/auth_prefs_helper.dart';
import 'package:sales_beeorder_app/module_auth/request/login_request/login_request.dart';
import 'package:sales_beeorder_app/module_auth/response/login_response/login_response.dart';
import 'package:sales_beeorder_app/utils/helpers/status_code_helper.dart';

@Injectable()
class AuthService {
  final AuthPrefsHelper _prefsHelper;
  final AuthManager _authManager;
  final PublishSubject<AuthStatus> _authSubject = PublishSubject<AuthStatus>();

  AuthService(
    this._prefsHelper,
    this._authManager,
  );

  bool get isLoggedIn => _prefsHelper.isSignedIn();

  Stream<AuthStatus> get authListener => _authSubject.stream;
  String get username => _prefsHelper.getUsername() ?? '';

  Future<void> loginApi(String username, String password) async {
    LoginResponse? loginResult = await _authManager.login(LoginRequest(
      username: username,
      password: password,
    ));
    if (loginResult == null) {
      await logout();
      _authSubject.addError(S.current.networkError);
      throw AuthorizationException(S.current.networkError);
    } else if (loginResult.statusCode == '401') {
      await logout();
      _authSubject.addError(S.current.invalidCredentials);
      throw AuthorizationException(S.current.networkError);
    } else if (loginResult.token == null) {
      await logout();
      _authSubject.addError(StatusCodeHelper.getStatusCodeMessages(
          loginResult.statusCode ?? '0'));
      throw AuthorizationException(StatusCodeHelper.getStatusCodeMessages(
          loginResult.statusCode ?? '0'));
    }
    _prefsHelper.setUsername(username);
    _prefsHelper.setPassword(password);
    _prefsHelper.setToken(loginResult.token);
    _authSubject.add(AuthStatus.AUTHORIZED);
  }


  Future<String?> getToken() async {
    try {
      var tokenDate = _prefsHelper.getTokenDate();
      var diff = DateTime.now().difference(tokenDate).inMinutes;
      if (diff.abs() > 55) {
        throw TokenExpiredException('Token is created $diff minutes ago');
      }
      return _prefsHelper.getToken();
    } on AuthorizationException {
      _prefsHelper.deleteToken();
      await _prefsHelper.cleanAll();
      return null;
    } on TokenExpiredException {
      return await refreshToken();
    } catch (e) {
      await _prefsHelper.cleanAll();
      return null;
    }
  }

  /// refresh API token, this is done using Firebase Token Refresh
  Future<String?> refreshToken() async {
    String? username = _prefsHelper.getUsername();
    String? password = _prefsHelper.getPassword();
    if (username != null && password != null) {
      await loginApi(
        username,
        password,
      );
    }
    var token = await getToken();
    if (token != null) {
      return token;
    }
    throw const AuthorizationException('error getting token');
  }

  Future<void> logout() async {
    await _prefsHelper.cleanAll();
  }


}
