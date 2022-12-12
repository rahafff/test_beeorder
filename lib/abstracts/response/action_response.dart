// To parse this JSON data, do
//
//     final webServiceResponse = webServiceResponseFromJson(jsonString);

import 'dart:convert';

WebServiceResponse webServiceResponseFromJson(String str) => WebServiceResponse.fromJson(json.decode(str));

String webServiceResponseToJson(WebServiceResponse data) => json.encode(data.toJson());

class WebServiceResponse {
  WebServiceResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  dynamic data;

  factory WebServiceResponse.fromJson(Map<String, dynamic> json) => WebServiceResponse(
    statusCode: json["status_code"],
    msg: json["msg"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "msg": msg,
    "data": data,
  };
}
