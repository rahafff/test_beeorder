import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_auth/request/register_request/register_request.dart';
import 'package:sales_beeorder_app/module_auth/ui/screen/singup_screen.dart';
import 'package:sales_beeorder_app/module_auth/ui/states/signup_states/signUp_state.dart';
import 'package:sales_beeorder_app/module_auth/ui/widget/login_widgets/custom_field.dart';
import 'package:sales_beeorder_app/utils/helpers/custom_flushbar.dart';
import 'package:sales_beeorder_app/utils/images/images.dart';
import 'package:flutter/material.dart';
import '../../widget/login_widgets/custem_button.dart';

class SignUpStateInit extends SignUpState {
  SignUpStateInit(SingUpScreenState screen, {String? error}) : super(screen) {
    if (error != null) {
      CustomFlushBarHelper.createError(
              title: S.current.warning, message: error)
          .show(screen.context);
    }
  }
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController licensePlateController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  int? genderValue = 1;

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
                          width: 100,
                          height: 230,
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 25,
                ),
                CustomLoginFormField(
                  hintText: S.of(context).phoneNumber,
                  validator: true,
                  controller: phoneController,
                  password: false,
                  phone: true,
                  preIcon: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
                    child: Text('+963'),
                  ),
                  borderRadius: 15,
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: CustomLoginFormField(
                        hintText: S.of(context).firstName,
                        validator: true,
                        controller: firstNameController,
                        preIcon: Icon(Icons.person),
                        borderRadius: 15,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: CustomLoginFormField(
                        hintText: S.of(context).lastName,
                        validator: true,
                        controller: lastNameController,
                        preIcon: Icon(Icons.person),
                        borderRadius: 15,
                      ),
                    ),
                  ],
                ),


                SizedBox(
                  height: 25,
                ),

                CustomLoginFormField(
                  hintText: S.of(context).licensePlate,
                  validator: true,
                  controller: licensePlateController,
                  preIcon: Icon(Icons.account_box_rounded),
                  borderRadius: 15,
                ),
                SizedBox(
                  height: 20,
                ),

                Text(
                  S.of(context).chooseYourVehicle,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Wrap(
                  children: [
                    RadioListTile(
                      value: 1,
                      groupValue: genderValue,
                      onChanged: (v) {
                        genderValue = v as int;
                        screen.refresh();
                      },
                      title: Text(S.of(context).motor),
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: genderValue,
                      onChanged: (v) {
                        genderValue = v as int;
                        screen.refresh();
                      },
                      title: Text(S.of(context).bicycle),
                    ),

                  ],
                ),


                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  buttonTab: () {
                    if (_loginKey.currentState!.validate() ) {
                      screen.signUpClient(RegisterRequest(
                       cityId: 1,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        licensePlate: licensePlateController.text,
                        mobile: phoneController.text,
                          vehicle :genderValue
                      ));
                    }
                  },
                  loading: screen.loadingSnapshot.connectionState ==
                      ConnectionState.waiting,
                  text: S.of(context).createAccount,
                  bgColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
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
