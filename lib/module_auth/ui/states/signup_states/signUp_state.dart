import 'package:sales_beeorder_app/module_auth/ui/screen/singup_screen.dart';
import 'package:flutter/material.dart';

abstract class SignUpState {
  final SingUpScreenState screen;
  SignUpState(this.screen);

  Widget getUI(BuildContext context);
}
