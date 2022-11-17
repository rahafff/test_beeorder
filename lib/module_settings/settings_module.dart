import 'package:injectable/injectable.dart';
import 'package:sales_beeorder_app/abstracts/module/yes_module.dart';
import 'package:sales_beeorder_app/module_settings/setting_routes.dart';
import 'package:sales_beeorder_app/module_settings/ui/settings_page/settings_page.dart';

@injectable
class SettingsModule extends RoutModule {
  final SettingsScreen settingsScreen;
  SettingsModule(this.settingsScreen) {
    RoutModule.RoutesMap.addAll({
      SettingRoutes.ROUTE_SETTINGS: (context) => settingsScreen,
    });
  }
}
