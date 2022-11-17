class Urls {

  static const String DOMAIN = 'https://dev-delivery-v4.lemonilab.com/api';
  static const String DOMAIN2 = 'https://dev-webdash.lemonilab.com/api/coreservices/index.php/home';


  //-------------Auth------------
  static const String LOGIN = DOMAIN + '/login';
  static const String SIGNUP = DOMAIN + '/signup';


//-----------Restaurant-----------
  static const String ADD_RESTAURANT = DOMAIN2 + '/add_new_restaurant/format/json';
  static const String GET_RESTAURANT = DOMAIN2 + '/get_restaurant';
}
