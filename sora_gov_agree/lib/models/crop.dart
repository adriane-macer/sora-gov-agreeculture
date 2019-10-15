// To parse this JSON data, do
//
//     final crop = cropFromJson(jsonString);

import 'dart:convert';

class Crop {
  final int id;
  final impressionsCount;
  final countryId;
  final categoryId;
  final int userId;
  final orgId;
  final groupId;
  final String reference;
  final kind;
  final String status;
  final String userPic;
  final String userName;
  final String name;
  final String nameEn;
  final String nameLocal;
  final String photo;
  final String address;
  final latitude;
  final longitude;
  final String province;
  final String city;
  final String district;
  final String shortDescription;
  final String shortDescriptionEn;
  final String measure;
  final int paymentClass;
  final String currency;
  final currencyPrice;
  final maximumPrice;
  final minimumPrice;
  final String state;
  final bool featured;
  final DateTime createdAt;
  final DateTime updatedAt;

  Crop({
    this.id,
    this.impressionsCount,
    this.countryId,
    this.categoryId,
    this.userId,
    this.orgId,
    this.groupId,
    this.reference,
    this.kind,
    this.status,
    this.userPic,
    this.userName,
    this.name,
    this.nameEn,
    this.nameLocal,
    this.photo,
    this.address,
    this.latitude,
    this.longitude,
    this.province,
    this.city,
    this.district,
    this.shortDescription,
    this.shortDescriptionEn,
    this.measure,
    this.paymentClass,
    this.currency,
    this.currencyPrice,
    this.maximumPrice,
    this.minimumPrice,
    this.state,
    this.featured,
    this.createdAt,
    this.updatedAt,
  });

  factory Crop.fromJson(String str) => Crop.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Crop.fromMap(Map<String, dynamic> json) => Crop(
        id: json["id"],
        impressionsCount: json["impressions_count"],
        countryId: json["country_id"],
        categoryId: json["category_id"],
        userId: json["user_id"],
        orgId: json["org_id"],
        groupId: json["group_id"],
        reference: json["reference"],
        kind: json["kind"],
        status: json["status"],
        userPic: json["user_pic"],
        userName: json["user_name"],
        name: json["name"],
        nameEn: json["name_en"],
        nameLocal: json["name_local"],
        photo: json["photo"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        province: json["province"],
        city: json["city"],
        district: json["district"],
        shortDescription: json["short_description"],
        shortDescriptionEn: json["short_description_en"],
        measure: json["measure"],
        paymentClass: json["payment_class"],
        currency: json["currency"],
        currencyPrice: json["currency_price"],
        maximumPrice: json["maximum_price"],
        minimumPrice: json["minimum_price"],
        state: json["state"],
        featured: json["featured"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "impressions_count": impressionsCount,
        "country_id": countryId,
        "category_id": categoryId,
        "user_id": userId,
        "org_id": orgId,
        "group_id": groupId,
        "reference": reference,
        "kind": kind,
        "status": status,
        "user_pic": userPic,
        "user_name": userName,
        "name": name,
        "name_en": nameEn,
        "name_local": nameLocal,
        "photo": photo,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "province": province,
        "city": city,
        "district": district,
        "short_description": shortDescription,
        "short_description_en": shortDescriptionEn,
        "measure": measure,
        "payment_class": paymentClass,
        "currency": currency,
        "currency_price": currencyPrice,
        "maximum_price": maximumPrice,
        "minimum_price": minimumPrice,
        "state": state,
        "featured": featured,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
