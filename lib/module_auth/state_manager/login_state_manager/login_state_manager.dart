import 'package:sales_beeorder_app/module_auth/enums/auth_status.dart';
import 'package:sales_beeorder_app/module_auth/service/auth_service/auth_service.dart';
import 'package:sales_beeorder_app/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:sales_beeorder_app/module_auth/ui/states/login_states/login_state.dart';
import 'package:sales_beeorder_app/module_auth/ui/states/login_states/login_state_init.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class LoginStateManager {
  final AuthService _authService;

  final PublishSubject<LoginState> _loginStateSubject =
      PublishSubject<LoginState>();
  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();

  late LoginScreenState _screenState;

  LoginStateManager(this._authService)  {
    _authService.authListener.listen((event) async{
      _loadingStateSubject.add(AsyncSnapshot.nothing());
      switch (event) {
        case AuthStatus.AUTHORIZED_CLIENT:
          _screenState.moveToHomePage();
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

    LoginScreenState _loginScreenState,
  ) {
    _screenState = _loginScreenState;
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _authService.loginApi(username);
  }

}
