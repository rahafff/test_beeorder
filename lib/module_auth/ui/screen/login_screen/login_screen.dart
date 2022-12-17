import 'dart:async';
import 'package:sales_beeorder_app/module_auth/state_manager/login_state_manager/login_state_manager.dart';
import 'package:sales_beeorder_app/module_auth/ui/states/login_states/login_state.dart';
import 'package:sales_beeorder_app/module_auth/ui/states/login_states/login_state_init.dart';
import 'package:sales_beeorder_app/utils/components/fixed_container.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../module_resturants/restaurant_route.dart';

@injectable
class LoginScreen extends StatefulWidget {
  final LoginStateManager _stateManager;

  LoginScreen(this._stateManager);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  late LoginState _currentStates;
  late AsyncSnapshot loadingSnapshot;
  late StreamSubscription _stateSubscription;

  void refresh() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    loadingSnapshot = AsyncSnapshot.nothing();
    _currentStates = LoginStateInit(this);
    _stateSubscription = widget._stateManager.stateStream.listen((event) {
      if (mounted) {
        setState(() {
          _currentStates = event;
        });
      }
    });
    widget._stateManager.loadingStream.listen((event) {
      if (this.mounted) {
        setState(() {
          loadingSnapshot = event;
        });
      }
    });
    super.initState();;
  }

  bool  argsF = false;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null ) {
      argsF = true;
    }
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        body: FixedContainer(
          child: loadingSnapshot.connectionState != ConnectionState.waiting
              ? _currentStates.getUI(context)
              : Stack(
                  children: [
                    _currentStates.getUI(context),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _stateSubscription.cancel();
    super.dispose();
  }

  void loginClient(String username, String password ) {
    widget._stateManager.loginClient(username,password, this);
  }

  void moveToNext() {
    Navigator.pushNamedAndRemoveUntil(context, RestaurantRoutes.VIEW_ALL,(route) => false);
  }

}
