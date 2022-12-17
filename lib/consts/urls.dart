class Urls {

  static const String DOMAIN = 'https://api.masdar-pro.com';


  //-------------Auth------------
  static const String CREATE_TOKEN_API = DOMAIN + '/login_check';



//-----------Restaurant-----------
  static const String GET_RESTAURANT = DOMAIN + '/emenu/getorders';
  static const String CHANGE_ORDER_STATUS = DOMAIN + '/emenu/resolveorder/';
  static const String STORE_PROFILE = DOMAIN + '/userprofile';

}
