// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i30;
import '../module_auth/authoriazation_module.dart' as _i27;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i13;
import '../module_auth/service/auth_service/auth_service.dart' as _i14;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i15;
import '../module_auth/state_manager/signup_state_manager.dart' as _i18;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i22;
import '../module_auth/ui/screen/singup_screen.dart' as _i19;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i6;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i7;
import '../module_network/http_client/http_client.dart' as _i11;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i9;
import '../module_notifications/repository/notification_repo.dart' as _i16;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i21;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i5;
import '../module_resturants/repository/resturant_repository.dart' as _i17;
import '../module_resturants/restaurant_module.dart' as _i28;
import '../module_resturants/state_manager/restaurants_state_manager.dart'
    as _i23;
import '../module_resturants/ui/screens/restaurant_screen.dart' as _i24;
import '../module_settings/settings_module.dart' as _i29;
import '../module_settings/ui/settings_page/settings_page.dart' as _i25;
import '../module_splash/splash_module.dart' as _i26;
import '../module_splash/ui/screen/splash_screen.dart' as _i20;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i10;
import '../module_theme/service/theme_service/theme_service.dart' as _i12;
import '../utils/global/global_state_manager.dart' as _i4;
import '../utils/logger/logger.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.singleton<_i4.GlobalStateManager>(_i4.GlobalStateManager());
  gh.factory<_i5.LocalNotificationService>(
      () => _i5.LocalNotificationService());
  gh.factory<_i6.LocalizationPreferencesHelper>(
      () => _i6.LocalizationPreferencesHelper());
  gh.factory<_i7.LocalizationService>(
      () => _i7.LocalizationService(get<_i6.LocalizationPreferencesHelper>()));
  gh.factory<_i8.Logger>(() => _i8.Logger());
  gh.factory<_i9.NotificationsPrefHelper>(() => _i9.NotificationsPrefHelper());
  gh.factory<_i10.ThemePreferencesHelper>(() => _i10.ThemePreferencesHelper());
  gh.factory<_i11.ApiClient>(() => _i11.ApiClient(get<_i8.Logger>()));
  gh.factory<_i12.AppThemeDataService>(
      () => _i12.AppThemeDataService(get<_i10.ThemePreferencesHelper>()));
  gh.factory<_i13.AuthRepository>(() => _i13.AuthRepository(
        get<_i11.ApiClient>(),
        get<_i8.Logger>(),
      ));
  gh.factory<_i14.AuthService>(() => _i14.AuthService(
        get<_i3.AuthPrefsHelper>(),
        get<_i13.AuthRepository>(),
      ));
  gh.factory<_i15.LoginStateManager>(
      () => _i15.LoginStateManager(get<_i14.AuthService>()));
  gh.factory<_i16.NotificationRepo>(() => _i16.NotificationRepo(
        get<_i11.ApiClient>(),
        get<_i14.AuthService>(),
      ));
  gh.factory<_i17.RestaurantRepository>(() => _i17.RestaurantRepository(
        get<_i11.ApiClient>(),
        get<_i14.AuthService>(),
      ));
  gh.factory<_i18.SignUpStateManager>(
      () => _i18.SignUpStateManager(get<_i14.AuthService>()));
  gh.factory<_i19.SingUpScreen>(
      () => _i19.SingUpScreen(get<_i18.SignUpStateManager>()));
  gh.factory<_i20.SplashScreen>(
      () => _i20.SplashScreen(get<_i14.AuthService>()));
  gh.factory<_i21.FireNotificationService>(() => _i21.FireNotificationService(
        get<_i9.NotificationsPrefHelper>(),
        get<_i16.NotificationRepo>(),
      ));
  gh.factory<_i22.LoginScreen>(
      () => _i22.LoginScreen(get<_i15.LoginStateManager>()));
  gh.factory<_i23.RestaurantCubit>(
      () => _i23.RestaurantCubit(get<_i17.RestaurantRepository>()));
  gh.factory<_i24.RestaurantsScreen>(
      () => _i24.RestaurantsScreen(get<_i23.RestaurantCubit>()));
  gh.factory<_i25.SettingsScreen>(() => _i25.SettingsScreen(
        get<_i14.AuthService>(),
        get<_i7.LocalizationService>(),
        get<_i12.AppThemeDataService>(),
        get<_i21.FireNotificationService>(),
      ));
  gh.factory<_i26.SplashModule>(
      () => _i26.SplashModule(get<_i20.SplashScreen>()));
  gh.factory<_i27.AuthorizationModule>(() => _i27.AuthorizationModule(
        get<_i22.LoginScreen>(),
        get<_i19.SingUpScreen>(),
      ));
  gh.factory<_i28.RestaurantsModule>(
      () => _i28.RestaurantsModule(get<_i24.RestaurantsScreen>()));
  gh.factory<_i29.SettingsModule>(
      () => _i29.SettingsModule(get<_i25.SettingsScreen>()));
  gh.factory<_i30.MyApp>(() => _i30.MyApp(
        get<_i12.AppThemeDataService>(),
        get<_i7.LocalizationService>(),
        get<_i21.FireNotificationService>(),
        get<_i5.LocalNotificationService>(),
        get<_i26.SplashModule>(),
        get<_i27.AuthorizationModule>(),
        get<_i28.RestaurantsModule>(),
        get<_i29.SettingsModule>(),
      ));
  return get;
}
