class CreateRestaurantRequest {
  String? name;
  double? longitude;
  double? latitude;
  String? details;

  CreateRestaurantRequest({this.latitude,required this.longitude,required this.name , this.details});

  Map<String, dynamic> toJson() {
    return {'name': name  ,"latitude": latitude, 'longitude': longitude, 'details':details};
  }
}
