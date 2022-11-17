import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_beeorder_app/abstracts/states/state.dart';
import 'package:sales_beeorder_app/utils/images/images.dart';

class LoadingState extends States {
  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
