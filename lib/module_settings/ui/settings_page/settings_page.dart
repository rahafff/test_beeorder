import 'package:injectable/injectable.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:flutter/material.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_auth/authorization_routes.dart';
import 'package:sales_beeorder_app/module_auth/service/auth_service/auth_service.dart';
import 'package:sales_beeorder_app/module_localization/service/localization_service/localization_service.dart';
import 'package:sales_beeorder_app/module_notifications/service/fire_notification_service/fire_notification_service.dart';
import 'package:sales_beeorder_app/module_theme/service/theme_service/theme_service.dart';
import 'package:sales_beeorder_app/utils/components/fixed_container.dart';

@injectable
class SettingsScreen extends StatefulWidget {
  final AuthService _authService;
  final LocalizationService _localizationService;
  final AppThemeDataService _themeDataService;
  final FireNotificationService _notificationService;

  SettingsScreen(
    this._authService,
    this._localizationService,
    this._themeDataService,
    this._notificationService,
  );

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).setting),),
      body: FixedContainer(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Container(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, 3), // changes position of shadow
                  )
                ],borderRadius: BorderRadius.circular(25)),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),

                  child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      ListTileSwitch(
                        value: Theme.of(context).brightness == Brightness.dark,
                        leading: Icon(
                            Theme.of(context).brightness == Brightness.dark
                                ? Icons.nightlight_round_rounded
                                : Icons.wb_sunny,
                            ),
                        onChanged: (mode) {
                          widget._themeDataService.switchDarkMode(mode);
                        },
                        visualDensity: VisualDensity.comfortable,
                        switchType: SwitchType.cupertino,
                        switchActiveColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        title: Text(
                          S.of(context).darkMode,
                          // style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.language),
                        title: Text(
                          S.of(context).language,
                          // style: TextStyle(color: Colors.white),
                        ),
                        trailing: DropdownButton(
                            // dropdownColor: Theme.of(context).primaryColor,
                            value: Localizations.localeOf(context).languageCode,
                            // style: TextStyle(color: Colors.white),
                            underline: Container(),
                            icon: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.arrow_drop_down_rounded,
                                 ),
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  'العربية',

                                ),
                                value: 'ar',
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'English',

                                ),
                                value: 'en',
                              ),
                            ],
                            onChanged: (newLang) {
                              print("hihihih"+ newLang.toString() );
                              widget._localizationService
                                  .setLanguage(newLang.toString());
                            }),
                      ),
                  ListTile(
                        leading: Icon(Icons.person_rounded),
                        title: Text(
                          S.of(context).signOut,
                          // style: TextStyle(color: Colors.white),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: Icon(
                            Icons.logout_rounded,
                            // color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          widget._authService.logout().then((value) {
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                AuthorizationRoutes.LOGIN_SCREEN,
                                (route) => false);
                          });
                        },
                      ) ,

                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
