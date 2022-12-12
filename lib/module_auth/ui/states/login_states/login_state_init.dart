import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:sales_beeorder_app/module_auth/ui/states/login_states/login_state.dart';
import 'package:sales_beeorder_app/module_auth/ui/widget/login_widgets/custem_button.dart';
import 'package:sales_beeorder_app/module_auth/ui/widget/login_widgets/custom_field.dart';
import 'package:sales_beeorder_app/utils/helpers/custom_flushbar.dart';
import 'package:sales_beeorder_app/utils/images/images.dart';
import 'package:flutter/material.dart';

class LoginStateInit extends LoginState {
  LoginStateInit(LoginScreenState screen, {String? error}) : super(screen) {
    if (error != null) {
      CustomFlushBarHelper.createError(title: S.current.warning, message: error)
          .show(screen.context);
    }
  }
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  @override
  Widget getUI(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _loginKey,
        child: Container(
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: <Widget>[
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.red.shade400,
                        Colors.red.shade900,
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Color(0xFFcccccf),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ),
                            Text(
                              'Welcome back',
                              style: TextStyle(
                                  color: Color(0xFF777779),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Image.asset(
                          ImageAsset.PAYMENT,
                          height: 70,
                        )
                      ],
                    ),
                    SizedBox(height: 50),
                    CustomLoginFormField(
                      hintText: S.of(context).email,
                      validator: true,
                      controller: usernameController,
                      password: false,
                      borderRadius: 15,
                      contentPadding: EdgeInsetsDirectional.all(12),
                    ),
                    SizedBox(height: 15),
                    CustomLoginFormField(
                      hintText: S.of(context).password,
                      controller: passwordController,
                      validator: true,
                      password: true,
                      borderRadius: 15,
                      contentPadding: EdgeInsetsDirectional.all(12),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomButton(
                  buttonTab: () {
                    if (_loginKey.currentState!.validate()) {
                      screen.loginClient(
                        usernameController.text,
                        passwordController.text,
                      );
                    }
                  },
                  loading: screen.loadingSnapshot.connectionState ==
                      ConnectionState.waiting,
                  text: S.of(context).login,
                  bgColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
