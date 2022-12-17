import 'dart:convert';

class StoreResponse {
  StoreResponse({
    // this.userName,
    this.storeName,
    // this.hasStore,
    // this.phoneNumber,
    // this.country,
    // this.city,
    // this.sex,
    // this.image,
    // this.images,
    // this.hasMasdar,
    // this.storeId,
    // this.notification,
    // this.packageId,
    // this.coverImages,
    // this.about,
    // this.slug,
    // this.storeSlug,
  });

  // String? userName;
  String? storeName;
  // int? hasStore;
  // String? phoneNumber;
  // Country country;
  // String city;
  // bool sex;
  // String image;
  // Images images;
  // int hasMasdar;
  // int storeId;
  // int notification;
  // int packageId;
  // Images coverImages;
  // dynamic about;
  // String slug;
  // String storeSlug;

  factory StoreResponse.fromJson(Map<String, dynamic> json) => StoreResponse(
    // userName: json["userName"],
    storeName: json["storeName"],
    // hasStore: json["hasStore"],
    // phoneNumber: json["phoneNumber"],
    // country: Country.fromJson(json["country"]),
    // city: json["city"],
    // sex: json["sex"],
    // image: json["image"],
    // images: Images.fromJson(json["images"]),
    // hasMasdar: json["hasMasdar"],
    // storeId: json["storeID"],
    // notification: json["notification"],
    // packageId: json["packageID"],
    // coverImages: Images.fromJson(json["coverImages"]),
    // about: json["about"],
    // slug: json["slug"],
    // storeSlug: json["storeSlug"],
  );
}

// class Country {
//   Country({
//     this.code,
//     this.name,
//     this.arName,
//     this.enName,
//     this.callingCode,
//   });
//
//   String code;
//   String name;
//   String arName;
//   String enName;
//   String callingCode;
//
//   factory Country.fromJson(Map<String, dynamic> json) => Country(
//     code: json["code"],
//     name: json["name"],
//     arName: json["ar_name"],
//     enName: json["en_name"],
//     callingCode: json["calling_code"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "code": code,
//     "name": name,
//     "ar_name": arName,
//     "en_name": enName,
//     "calling_code": callingCode,
//   };
// }
//
// class Images {
//   Images({
//     this.image,
//     this.thumb,
//     this.img,
//   });
//
//   String image;
//   String thumb;
//   String img;
//
//   factory Images.fromJson(Map<String, dynamic> json) => Images(
//     image: json["image"],
//     thumb: json["thumb"],
//     img: json["img"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "image": image,
//     "thumb": thumb,
//     "img": img,
//   };
// }
