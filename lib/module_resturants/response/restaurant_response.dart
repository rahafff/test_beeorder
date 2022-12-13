// To parse this JSON data, do
//
//     final orderResponse = orderResponseFromJson(jsonString);

import 'dart:convert';
OrderResponse orderResponseFromJson(String str) => OrderResponse.fromJson(json.decode(str));
class OrderResponse {
  OrderResponse({
    this.id,
    this.type,
    this.clientName,
    this.clientNumber,
    this.details,
    this.clientLatLon,
    this.clientLocationStr,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.fromStoreName,
   required this.finishOrder,
    this.deliveryTime,
    this.payment
  });
  bool finishOrder = false;
  int? id;
  int? type;
  String? clientName;
  String? clientNumber;
  String? details;
  ClientLatLon? clientLatLon;
  String? clientLocationStr;
  AtedAt? createdAt;
  AtedAt? updatedAt;
  int? status;
  String? fromStoreName;

  int? payment;
  String? deliveryTime;


  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    id: json["id"],
    type: json["type"],
    clientName: json["clientName"],
    clientNumber: json["clientNumber"],
    details: json["details"],
    clientLatLon: ClientLatLon.fromJson(json["clientLatLon"]),
    clientLocationStr: json["clientLocationStr"],
    createdAt: AtedAt.fromJson(json["createdAt"]),
    updatedAt: AtedAt.fromJson(json["updatedAt"]),
    deliveryTime: json["deliveryTime"],
    status: json["status"],
    fromStoreName: json["fromStoreName"],
    payment: json["payment"],
    finishOrder: false
  );

}

class ClientLatLon {
  ClientLatLon({
    this.lat,
    this.lon,
  });

  double? lat;
  double? lon;

  factory ClientLatLon.fromJson(Map<String, dynamic> json) => ClientLatLon(
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
  };
}

class AtedAt {
  AtedAt({
    this.timezone,
    this.offset,
    this.timestamp,
  });

  Timezone? timezone;
  int? offset;
  int? timestamp;

  factory AtedAt.fromJson(Map<String, dynamic> json) => AtedAt(
    timezone: Timezone.fromJson(json["timezone"]),
    offset: json["offset"],
    timestamp: json["timestamp"],
  );

}

class Timezone {
  Timezone({
    this.name,
    this.transitions,
    this.location,
  });

  String? name;
  List<Transition>? transitions;
  Location? location;

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
    name: json["name"],
    transitions: List<Transition>.from(json["transitions"].map((x) => Transition.fromJson(x))),
    location: Location.fromJson(json["location"]),
  );

}

class Location {
  Location({
    this.countryCode,
    this.latitude,
    this.longitude,
    this.comments,
  });

  String? countryCode;
  int? latitude;
  int? longitude;
  String? comments;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    countryCode: json["country_code"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    comments: json["comments"],
  );

}

class Transition {
  Transition({
    this.ts,
    this.time,
    this.offset,
    this.isdst,
    this.abbr,
  });

  double? ts;
  String? time;
  int? offset;
  bool? isdst;
  String? abbr;

  factory Transition.fromJson(Map<String, dynamic> json) => Transition(
    ts: json["ts"].toDouble(),
    time: json["time"],
    offset: json["offset"],
    isdst: json["isdst"],
    abbr: json["abbr"],
  );

}
