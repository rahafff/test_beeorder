import 'package:latlong2/latlong.dart';

class RestaurantResponse {
  RestaurantResponse({
    this.id,
    this.longitude,
    this.latitude,
    this.name,
    this.details,
    this.createdAt,this.location,this.distance
  });

  String? id;
  String? longitude;
  String? latitude;
  String? name;
  String? details;
  String? createdAt;
  LatLng? location;
  double? distance;

  RestaurantResponse.fromJson(Map<String, dynamic> json) {
    longitude = json["longitude"];
    id = json["id"];
    latitude = json["latitude"];
    name = json["name"];
    details = json["details"];
    createdAt = json["created_at"];
    location = LatLng(double.parse(latitude ?? '0'), double.parse(longitude ?? '0'));
    distance =0;
  }
}
