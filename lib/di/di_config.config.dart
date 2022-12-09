// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i27;
import '../module_auth/authoriazation_module.dart' as _i25;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i12;
import '../module_auth/service/auth_service/auth_service.dart' as _i13;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i14;
import '../module_auth/state_manager/signup_state_manager.dart' as _i17;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i20;
import '../module_auth/ui/screen/singup_screen.dart' as _i18;
import '../module_auth/ui/screen/welcome_screen.dart' as _i9;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i5;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i6;
import '../module_network/http_client/http_client.dart' as _i10;
import '../module_resturants/repository/resturant_repository.dart' as _i15;
import '../module_resturants/restaurant_module.dart' as _i26;
import '../module_resturants/state_manager/restaurants_state_manager.dart'
    as _i21;
import '../module_resturants/ui/screens/restaurant_screen.dart' as _i22;
import '../module_settings/settings_module.dart' as _i23;
import '../module_settings/ui/settings_page/settings_page.dart' as _i16;
import '../module_splash/splash_module.dart' as _i24;
import '../module_splash/ui/screen/splash_screen.dart' as _i19;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i8;
import '../module_theme/service/theme_service/theme_service.dart' as _i11;
import '../utils/global/global_state_manager.dart' as _i4;
import '../utils/logger/logger.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i5.LocalizationPreferencesHelper>(
      () => _i5.LocalizationPreferencesHelper());
  gh.factory<_i6.LocalizationService>(
      () => _i6.LocalizationService(get<_i5.LocalizationPreferencesHelper>()));
  gh.factory<_i7.Logger>(() => _i7.Logger());
  gh.factory<_i8.ThemePreferencesHelper>(() => _i8.ThemePreferencesHelper());
  gh.factory<_i9.WelcomePage>(() => _i9.WelcomePage());
  gh.factory<_i10.ApiClient>(() => _i10.ApiClient(get<_i7.Logger>()));
  gh.factory<_i11.AppThemeDataService>(
      () => _i11.AppThemeDataService(get<_i8.ThemePreferencesHelper>()));
  gh.factory<_i12.AuthRepository>(() => _i12.AuthRepository(
        get<_i10.ApiClient>(),
        get<_i7.Logger>(),
      ));
  gh.factory<_i13.AuthService>(() => _i13.AuthService(
        get<_i3.AuthPrefsHelper>(),
        get<_i12.AuthRepository>(),
      ));
  gh.factory<_i14.LoginStateManager>(
      () => _i14.LoginStateManager(get<_i13.AuthService>()));
  gh.factory<_i15.RestaurantRepository>(() => _i15.RestaurantRepository(
        get<_i10.ApiClient>(),
        get<_i13.AuthService>(),
      ));
  gh.factory<_i16.SettingsScreen>(() => _i16.SettingsScreen(
        get<_i13.AuthService>(),
        get<_i6.LocalizationService>(),
        get<_i11.AppThemeDataService>(),
      ));
  gh.factory<_i17.SignUpStateManager>(
      () => _i17.SignUpStateManager(get<_i13.AuthService>()));
  gh.factory<_i18.SingUpScreen>(
      () => _i18.SingUpScreen(get<_i17.SignUpStateManager>()));
  gh.factory<_i19.SplashScreen>(
      () => _i19.SplashScreen(get<_i13.AuthService>()));
  gh.factory<_i20.LoginScreen>(
      () => _i20.LoginScreen(get<_i14.LoginStateManager>()));
  gh.factory<_i21.RestaurantCubit>(
      () => _i21.RestaurantCubit(get<_i15.RestaurantRepository>()));
  gh.factory<_i22.RestaurantsScreen>(
      () => _i22.RestaurantsScreen(get<_i21.RestaurantCubit>()));
  gh.factory<_i23.SettingsModule>(
      () => _i23.SettingsModule(get<_i16.SettingsScreen>()));
  gh.factory<_i24.SplashModule>(
      () => _i24.SplashModule(get<_i19.SplashScreen>()));
  gh.factory<_i25.AuthorizationModule>(() => _i25.AuthorizationModule(
        get<_i20.LoginScreen>(),
        get<_i18.SingUpScreen>(),
        get<_i9.WelcomePage>(),
      ));
  gh.factory<_i26.RestaurantsModule>(
      () => _i26.RestaurantsModule(get<_i22.RestaurantsScreen>()));
  gh.factory<_i27.MyApp>(() => _i27.MyApp(
        get<_i11.AppThemeDataService>(),
        get<_i6.LocalizationService>(),
        get<_i24.SplashModule>(),
        get<_i25.AuthorizationModule>(),
        get<_i26.RestaurantsModule>(),
        get<_i23.SettingsModule>(),
      ));
  return get;
}
