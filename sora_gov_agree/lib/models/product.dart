import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int category;
  @JsonKey(name: "subcategory_id")
  final int subcategoryId;
  @JsonKey(name: "user_id")
  final int userId;
  @JsonKey(name: "org_id")
  final int orgId;
  @JsonKey(name: "group_id")
  final int groupId;
  final String reference;
  final int status;
  final int kind;
  @JsonKey(name: "user_pic")
  final String userPic;
  @JsonKey(name: "user_name")
  final String userName;
  @JsonKey(name: "name_en")
  final String nameEn;
  @JsonKey(name: "name_local")
  final String nameLocal;
  final String photo;
  final String address;
  final double latitude;
  final double longitude;
  final String province;
  final String city;
  final String district;
  @JsonKey(name: "short_description")
  final String shortDescription;
  @JsonKey(name: "short_description_en")
  final String shortDescriptionEn;
  final String link;
  @JsonKey(name: "sustainability_rating")
  final int sustainabilityRating;
  @JsonKey(name: "impressions_count")
  final int impressionsCount;
  final String terms;
  final String measure;
  @JsonKey(name: "payment_class")
  final int paymentClass;
  final String currency;
  @JsonKey(name: "currency_price")
  final double currencyPrice;
  @JsonKey(name: "maximum_price")
  final double maximumPrice;
  @JsonKey(name: "minimum_price")
  final double minimumPrice;
  final String state;
  final bool featured;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime deletedAt;
  final int gender;
  final String email;
  final String mobile;
  final String provider;
  final String uid;
  final int logistics;

  Product(
      {this.category,
      this.subcategoryId,
      this.userId,
      this.orgId,
      this.groupId,
      this.reference,
      this.status,
      this.kind,
      this.userPic,
      this.userName,
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
      this.link,
      this.sustainabilityRating,
      this.impressionsCount,
      this.terms,
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
      this.deletedAt,
      this.gender,
      this.email,
      this.mobile,
      this.provider,
      this.uid,
      this.logistics});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
