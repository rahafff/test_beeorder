import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:lehttp_overrides/lehttp_overrides.dart';
import 'package:device_info/device_info.dart';
import 'package:sales_beeorder_app/abstracts/module/yes_module.dart';
import 'package:sales_beeorder_app/di/di_config.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/hive/hive_init.dart';
import 'package:sales_beeorder_app/module_auth/authoriazation_module.dart';
import 'package:sales_beeorder_app/module_localization/service/localization_service/localization_service.dart';
import 'package:sales_beeorder_app/module_notifications/service/fire_notification_service/fire_notification_service.dart';
import 'package:sales_beeorder_app/module_notifications/service/local_notification_service/local_notification_service.dart';
import 'package:sales_beeorder_app/module_resturants/restaurant_module.dart';
import 'package:sales_beeorder_app/module_settings/settings_module.dart';
import 'package:sales_beeorder_app/module_splash/splash_module.dart';
import 'package:sales_beeorder_app/module_splash/splash_routes.dart';
import 'package:sales_beeorder_app/module_theme/service/theme_service/theme_service.dart';
import 'package:sales_beeorder_app/utils/logger/logger.dart';
import 'dart:io' as p;
import 'package:simple_moment/simple_moment.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    if (p.Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt < 26) {
        p.HttpOverrides.global = LEHttpOverrides();
      }
    }
  }
  await HiveSetUp.init();
  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Logger().error('Main', details.toString(), StackTrace.current);
    };
    await runZonedGuarded(() {
      configureDependencies();
      // Your App Here
      runApp(getIt<MyApp>());
    }, (error, stackTrace) {
      new Logger().error(
          'Main', error.toString() + stackTrace.toString(), StackTrace.current);
    });
  });
}

@injectable
class MyApp extends StatefulWidget {
  final AppThemeDataService _themeDataService;
  final LocalizationService _localizationService;
  final FireNotificationService _fireNotificationService;
  final LocalNotificationService _localNotificationService;
  final SplashModule _splashModule;
  final AuthorizationModule _authorizationModule;
  final RestaurantsModule _restaurantsModule;
  final SettingsModule _settingsModule;

  MyApp(
    this._themeDataService,
    this._localizationService,
    this._fireNotificationService,
    this._localNotificationService,
    this._splashModule,
    this._authorizationModule,
    this._restaurantsModule,
    this._settingsModule,
  );

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late String lang;
  late ThemeData activeTheme;
  bool authorized = false;

  @override
  void initState() {
    super.initState();
    lang = widget._localizationService.getLanguage();
    activeTheme = widget._themeDataService.getActiveTheme();

    widget._fireNotificationService.init();
    widget._localNotificationService.init();
    widget._localizationService.localizationStream.listen((event) {
      Moment.setLocaleGlobally(event == 'en' ? LocaleEn() : LocaleAr());
      lang = event;
      setState(() {});
    });
    widget._fireNotificationService.onNotificationStream.listen((event) {
      widget._localNotificationService.showNotification(event);
    });
    widget._localNotificationService.onLocalNotificationStream
        .listen((event) {});
//     getIt<GlobalStateManager>().stateStream.listen((event) {
//       if (mounted) {
//         setState(() {});
//       }
//     });
    widget._themeDataService.darkModeStream.listen((event) {
      activeTheme = event;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return getConfiguredApp(RoutModule.RoutesMap);
  }

  Widget getConfiguredApp(
    Map<String, WidgetBuilder> fullRoutesList,
  ) {
    return MaterialApp(
//      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      // navigatorObservers: <NavigatorObserver>[observer],
      // navigatorKey: GlobalVariable.navState,
      locale: Locale.fromSubtags(
        languageCode: lang,
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: activeTheme,
      supportedLocales: S.delegate.supportedLocales,
      title: 'Bee Order',
      routes: fullRoutesList,
      initialRoute: SplashRoutes.SPLASH_SCREEN,
    );
  }
}
