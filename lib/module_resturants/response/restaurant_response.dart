
class RestaurantResponse {
  RestaurantResponse({
    this.id,
    this.longitude,
    this.latitude,
    this.costumerName,
    this.details,
    this.createdAt,
    this.price,

    required this.isDone,
    required this.finishOrder
  });

  String? id;
  String? longitude;
  String? latitude;
  String? costumerName;
  String? details;
  String? createdAt;
  String? price;
  bool  isDone = false;
  bool  finishOrder = false;


  RestaurantResponse.fromJson(Map<String, dynamic> json) {
    longitude = json["longitude"];
    id = json["id"];
    latitude = json["latitude"];
    costumerName = json["name"];
    details = json["details"];
    createdAt = json["created_at"];
    price = json["created_at"];
    isDone = false;
    finishOrder = false;

  }
}
