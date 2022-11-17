import 'package:sales_beeorder_app/abstracts/module/yes_module.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sales_beeorder_app/module_resturants/ui/screens/restaurant_screen.dart';
import 'restaurant_route.dart';

@injectable
class RestaurantsModule extends RoutModule {
  final RestaurantsScreen _restaurantsScreen;
  RestaurantsModule(this._restaurantsScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      RestaurantRoutes.VIEW_ALL: (context) => _restaurantsScreen,
    };
  }
}
