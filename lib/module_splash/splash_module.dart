
import 'package:injectable/injectable.dart';
import 'package:sales_beeorder_app/abstracts/module/yes_module.dart';
import 'package:sales_beeorder_app/module_splash/splash_routes.dart';
import 'package:sales_beeorder_app/module_splash/ui/screen/splash_screen.dart';

@injectable
class SplashModule extends RoutModule {
  SplashModule(SplashScreen splashScreen) {
    RoutModule.RoutesMap.addAll(
        {SplashRoutes.SPLASH_SCREEN: (context) => splashScreen});
  }
}
