import 'package:sales_beeorder_app/abstracts/response/action_response.dart';
import 'package:sales_beeorder_app/module_auth/enums/auth_status.dart';
import 'package:sales_beeorder_app/module_auth/exceptions/auth_exception.dart';
import 'package:sales_beeorder_app/module_auth/presistance/auth_prefs_helper.dart';
import 'package:sales_beeorder_app/module_auth/repository/auth/auth_repository.dart';
import 'package:sales_beeorder_app/module_auth/request/login_request/login_request.dart';
import 'package:sales_beeorder_app/module_auth/request/register_request/register_request.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AuthService {
  final AuthPrefsHelper _prefsHelper;
  final AuthRepository _authManager;
  final PublishSubject<AuthStatus> _authSubject = PublishSubject<AuthStatus>();

  AuthService(
    this._prefsHelper,
    this._authManager,
  );

  bool get isLoggedIn => _prefsHelper.isSignedIn();


  Stream<AuthStatus> get authListener => _authSubject.stream;
  String get username => _prefsHelper.getUsername() ?? '';
  String get password => _prefsHelper.getPassword() ?? '';


  Future<void> loginApi(String username) async {
    WebServiceResponse? loginResult = await _authManager.getToken(LoginRequest(
      mobile: username,

    ));
    if (loginResult == null) {
      await logout();
      _authSubject.addError('Connection error');
      // throw AuthorizationException('Connection error');
    } else if (!loginResult.success) {
      print('errrrorrr');
      await logout();
      _authSubject.addError(loginResult.errorMessage ?? '');
    }
    else{
    // LoginResponse response = LoginResponse.fromJson(loginResult?.data.insideData);
    _prefsHelper.setUsername(username);
    // _prefsHelper.setPassword(password);
    // _prefsHelper.setToken(response.token);
    _prefsHelper.setToken('eT8zP0H-RW-X89o7zBLUcZ:APA91bEpc7ghF4EoWNILCHs6r0VtYdWFFX_x61IqH-dNRiMbXcyVoOzwlxlQEUKqenbzNJDYPgJDORqgYmCb-F6LiCXtcjwT8s07Q_E0-f7ufwgeEeKZtDm9dWekMFi1rDgyhcFbyyfl');
    authStatusMap[AuthStatus.AUTHORIZED_CLIENT]=loginResult.errorMessage ?? '';
    _authSubject.add(AuthStatus.AUTHORIZED_CLIENT);}
  }

  Future<void> signUpApi(RegisterRequest request) async {
    WebServiceResponse? signResult = await _authManager.registerClient(request);
    if (signResult == null) {
      _authSubject.addError('Connection error');
      // throw AuthorizationException('Connection error');
    } else if (!signResult.success) {
      _authSubject.addError(signResult.errorMessage ?? '');
      // throw AuthorizationException(signResult.errorMessage);
    }else {
      authStatusMap[AuthStatus.CONFIRM_CODE]=signResult.errorMessage ??' ';
      _authSubject.add(AuthStatus.CONFIRM_CODE,);
    }
  }


  Future<String?> getToken() async {
    try {
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
        // password,
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
