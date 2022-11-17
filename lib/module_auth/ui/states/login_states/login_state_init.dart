import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_auth/authorization_routes.dart';
import 'package:sales_beeorder_app/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:sales_beeorder_app/module_auth/ui/states/login_states/login_state.dart';
import 'package:sales_beeorder_app/module_auth/ui/widget/login_widgets/custom_field.dart';
import 'package:sales_beeorder_app/utils/helpers/custom_flushbar.dart';
import 'package:sales_beeorder_app/utils/images/images.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widget/login_widgets/custem_button.dart';

class LoginStateInit extends LoginState {
  LoginStateInit(LoginScreenState screen, {String? error}) : super(screen) {
    if (error != null) {
      CustomFlushBarHelper.createError(
              title: S.current.warning, message: error)
          .show(screen.context);
    }
  }
  TextEditingController mobileController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  @override
  Widget getUI(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _loginKey,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: <Widget>[
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.asset(
                          ImageAsset.INCREASING,
                          width: 90,
                          height: 230,
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 45,
                ),
                CustomLoginFormField(
                  hintText: S.of(context).phoneNumber,
                  validator: true,
                  controller: mobileController,
                  password: false,
                  phone: true,
                  preIcon: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
                    child: Text('+963'),
                  ),
                  borderRadius: 15,
                ),
                SizedBox(
                  height: 45,
                ),

                CustomButton(
                  buttonTab: () {
                    if (_loginKey.currentState!.validate()) {
                      screen.loginClient(
                          mobileController.text.trim());
                    }
                  },
                  loading: screen.loadingSnapshot.connectionState ==
                      ConnectionState.waiting,
                  text: S.of(context).login,
                  bgColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: 15,
                ),

                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, AuthorizationRoutes.REGISTER_SCREEN);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(S.of(context).dontHaveAccount),
                    Text(S.of(context).createAccount ,
                      style: TextStyle(fontWeight: FontWeight.bold  ,color: Theme.of(context).primaryColor,),),
                  ],),
                ),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
