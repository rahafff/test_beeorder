import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_beeorder_app/module_auth/authorization_routes.dart';
import 'package:sales_beeorder_app/module_auth/service/auth_service/auth_service.dart';
import 'package:sales_beeorder_app/module_resturants/restaurant_route.dart';
import 'package:sales_beeorder_app/utils/images/images.dart';

@injectable
class SplashScreen extends StatefulWidget {
  final AuthService _authService;
  SplashScreen(this._authService);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((Dura) {
      _getNextRoute().then((route) {
        Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageAsset.SPLASH ,height: 300,),
              SizedBox(height: 20,),
              Text(
                'Cashier App',
                style: TextStyle(
                    color: Color(0xFFcccccf),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ],
          ),
        ));
  }

  Future<String> _getNextRoute() async {
    await Future.delayed(Duration(seconds: 3));
    // if (widget._authService.isLoggedIn) {
    //   return RestaurantRoutes.VIEW_ALL;
    // } else {
    //   return AuthorizationRoutes.LOGIN_SCREEN;
    // }
    return AuthorizationRoutes.WELCOME_SCREEN;
  }
}
