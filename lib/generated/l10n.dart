// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please Enter Your Email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `I have an account`
  String get iHaveAnAccount {
    return Intl.message(
      'I have an account',
      name: 'iHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Error Happened`
  String get errorHappened {
    return Intl.message(
      'Error Happened',
      name: 'errorHappened',
      desc: '',
      args: [],
    );
  }

  /// `Error Loading Data`
  String get errorLoadingData {
    return Intl.message(
      'Error Loading Data',
      name: 'errorLoadingData',
      desc: '',
      args: [],
    );
  }

  /// `Email Address is Required`
  String get emailAddressIsRequired {
    return Intl.message(
      'Email Address is Required',
      name: 'emailAddressIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get passwordIsTooShort {
    return Intl.message(
      'Password is too short',
      name: 'passwordIsTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get nameIsRequired {
    return Intl.message(
      'Name is required',
      name: 'nameIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your vehicle`
  String get chooseYourVehicle {
    return Intl.message(
      'Choose Your vehicle',
      name: 'chooseYourVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Please fill the field`
  String get pleaseCompleteField {
    return Intl.message(
      'Please fill the field',
      name: 'pleaseCompleteField',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `you don't have account? `
  String get dontHaveAccount {
    return Intl.message(
      'you don\'t have account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `signOut`
  String get signOut {
    return Intl.message(
      'signOut',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get darkMode {
    return Intl.message(
      'Dark mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Add new restaurant`
  String get addNewRestaurant {
    return Intl.message(
      'Add new restaurant',
      name: 'addNewRestaurant',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant name`
  String get restName {
    return Intl.message(
      'Restaurant name',
      name: 'restName',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Nearest`
  String get nearest {
    return Intl.message(
      'Nearest',
      name: 'nearest',
      desc: '',
      args: [],
    );
  }

  /// `Mark Restaurant location on the map`
  String get markRestLocation {
    return Intl.message(
      'Mark Restaurant location on the map',
      name: 'markRestLocation',
      desc: '',
      args: [],
    );
  }

  /// `Search for name`
  String get searchForName {
    return Intl.message(
      'Search for name',
      name: 'searchForName',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `license plate`
  String get licensePlate {
    return Intl.message(
      'license plate',
      name: 'licensePlate',
      desc: '',
      args: [],
    );
  }

  /// `Motor`
  String get motor {
    return Intl.message(
      'Motor',
      name: 'motor',
      desc: '',
      args: [],
    );
  }

  /// `Bicycle`
  String get bicycle {
    return Intl.message(
      'Bicycle',
      name: 'bicycle',
      desc: '',
      args: [],
    );
  }

  /// `There is problem with your connection , please try again`
  String get networkError {
    return Intl.message(
      'There is problem with your connection , please try again',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Wrong username or password`
  String get invalidCredentials {
    return Intl.message(
      'Wrong username or password',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Client name`
  String get clientName {
    return Intl.message(
      'Client name',
      name: 'clientName',
      desc: '',
      args: [],
    );
  }

  /// `Client number`
  String get clientNumber {
    return Intl.message(
      'Client number',
      name: 'clientNumber',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Credit card`
  String get creditCard {
    return Intl.message(
      'Credit card',
      name: 'creditCard',
      desc: '',
      args: [],
    );
  }

  /// `Delivery date`
  String get deliveryDate {
    return Intl.message(
      'Delivery date',
      name: 'deliveryDate',
      desc: '',
      args: [],
    );
  }

  /// `Create date`
  String get createDate {
    return Intl.message(
      'Create date',
      name: 'createDate',
      desc: '',
      args: [],
    );
  }

  /// `Current Order`
  String get currentOrder {
    return Intl.message(
      'Current Order',
      name: 'currentOrder',
      desc: '',
      args: [],
    );
  }

  /// `History order`
  String get historyOrder {
    return Intl.message(
      'History order',
      name: 'historyOrder',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to complete the order? `
  String get confirmMessage {
    return Intl.message(
      'Are you sure to complete the order? ',
      name: 'confirmMessage',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to cancel the order? `
  String get confirmCancelMessage {
    return Intl.message(
      'Are you sure to cancel the order? ',
      name: 'confirmCancelMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Hand`
  String get hand {
    return Intl.message(
      'Hand',
      name: 'hand',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Copied to clipboard`
  String get copied {
    return Intl.message(
      'Copied to clipboard',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `Menu Masdar `
  String get menuMasder {
    return Intl.message(
      'Menu Masdar ',
      name: 'menuMasder',
      desc: '',
      args: [],
    );
  }

  /// `Order type`
  String get orderType {
    return Intl.message(
      'Order type',
      name: 'orderType',
      desc: '',
      args: [],
    );
  }

  /// `Order Done`
  String get orderDone {
    return Intl.message(
      'Order Done',
      name: 'orderDone',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
