import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_beeorder_app/abstracts/states/state.dart';
import 'package:sales_beeorder_app/module_auth/ui/widget/login_widgets/custem_button.dart';
import 'package:sales_beeorder_app/utils/images/images.dart';

class ErrorState extends States {
  final String errMsg;
  final VoidCallback retry;

  ErrorState({required this.errMsg,required this.retry});

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImageAsset.NO_CONNECTION),
          SizedBox(
            height: 10,
          ),
          Text(
            errMsg,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),

          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 50,end: 50),
            child: CustomButton(bgColor: Theme.of(context).errorColor,buttonTab: retry,loading: false,text: 'Retry',textColor: Colors.white,),
          )
        ],
      ),
    );
  }
}
