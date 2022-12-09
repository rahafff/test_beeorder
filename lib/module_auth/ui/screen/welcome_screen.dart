import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:injectable/injectable.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_auth/ui/widget/login_widgets/custom_field.dart';
import 'package:sales_beeorder_app/module_resturants/restaurant_route.dart';
import 'package:sales_beeorder_app/utils/images/images.dart';

@injectable
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      Image.asset(ImageAsset.PAYMENT,height: 70,)
                    ],
                  ),
                  SizedBox(height: 50),
                  CustomLoginFormField(
                    hintText: S.of(context).phoneNumber,
                    validator: true,
                    // controller: mobileController,
                    password: false,
                    phone: true,
                    preIcon: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
                      child: Text('+963'),
                    ),
                    borderRadius: 15,
                  ),
                  SizedBox(height: 15),
                  CustomLoginFormField(
                    hintText: S.of(context).password,
                    validator: true,
                    password: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                    height: 55,
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Colors.red.shade400,
                        Colors.red.shade900,
                      ]),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, RestaurantRoutes.VIEW_ALL,(route) => false,);
                      },
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
