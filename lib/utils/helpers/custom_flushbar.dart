import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFlushBarHelper {
  static Flushbar createSuccess(
      {required String title,
      required String message,
      int timeout = 4,
      Color? background,
      bool top = false,
      EdgeInsets? padding,
      EdgeInsets? margin}) {
    return Flushbar(
      message: message,
      barBlur: 5.0,
      flushbarStyle: FlushbarStyle.FLOATING,
      icon: Icon(FontAwesomeIcons.checkCircle,color: Colors.white,),
      maxWidth: 600,
      leftBarIndicatorColor: Colors.green.shade900,
      backgroundColor: Colors.green.withOpacity(0.8),
      duration: Duration(seconds: timeout),
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(12),
      messageText: Text(message,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),),
    );
  }

  static Flushbar createError(
      {required String title, required String message, int timeout = 4}) {
    return Flushbar(
      message: message,
      barBlur: 5.0,
      flushbarStyle: FlushbarStyle.FLOATING,
      icon: Icon(FontAwesomeIcons.info,color: Colors.white,),
      maxWidth: 600,
      leftBarIndicatorColor: Colors.red.shade900,
      backgroundColor: Colors.red.withOpacity(0.8),
      duration: Duration(seconds: timeout),
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(12),
     messageText: Text(message,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),),
    );
  }
}
