import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_auth/enums/auth_status.dart';
import 'package:sales_beeorder_app/module_auth/presistance/auth_prefs_helper.dart';
import 'package:sales_beeorder_app/module_auth/response/store_response.dart';
import 'package:sales_beeorder_app/module_auth/service/auth_service/auth_service.dart';
import 'package:sales_beeorder_app/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:sales_beeorder_app/module_auth/ui/states/login_states/login_state.dart';
import 'package:sales_beeorder_app/module_auth/ui/states/login_states/login_state_init.dart';
import 'package:sales_beeorder_app/module_resturants/repository/resturant_repository.dart';

@injectable
class LoginStateManager {
  final AuthService _authService;
  final AuthPrefsHelper _prefsHelper;
  final RestaurantRepository _restaurantRepository;
  final PublishSubject<LoginState> _loginStateSubject =
      PublishSubject<LoginState>();
  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  late LoginScreenState _screenState;

  LoginStateManager(this._authService, this._restaurantRepository, this._prefsHelper) {
    _authService.authListener.listen((event) {
      _loadingStateSubject.add(AsyncSnapshot.nothing());
      switch (event) {
        case AuthStatus.AUTHORIZED:
          _loadingStateSubject.add(AsyncSnapshot.waiting());
          getProfile();
          break;
        default:
          _loginStateSubject.add(LoginStateInit(_screenState));
          break;
      }
    }).onError((err) {
      _loadingStateSubject.add(AsyncSnapshot.nothing());
      _loginStateSubject.add(LoginStateInit(_screenState, error: err));
    });
  }

  Stream<LoginState> get stateStream => _loginStateSubject.stream;

  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;
  void loginClient(
    String username,
    String password,
    LoginScreenState _loginScreenState,
  ) {
    _screenState = _loginScreenState;
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _authService.loginApi(username, password);
  }

  void getProfile() {
    _restaurantRepository.getStoreProfile().then((value) {
      if (value == null) {
        _loginStateSubject.addError(S.current.networkError);
      } else if (value.statusCode == '200') {
        StoreResponse storeProfile = StoreResponse.fromJson(value.data);
        _prefsHelper.setStoreName(storeProfile.storeName ?? '');
        _screenState.moveToNext();
      }
    });
  }
}
