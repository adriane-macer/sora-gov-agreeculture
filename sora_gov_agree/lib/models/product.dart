import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  Product(
      {this.breedPlantDate,
      this.targetHarvestSell,
      this.categoryId,
      this.subcategoryId,
      this.userId,
      this.orgId,
      this.groupId,
      this.reference,
      this.status,
      this.kind,
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
      this.quantity,
      this.urgency,
      this.createdAt,
      this.updatedAt});

  @JsonKey(name: "category_id")
  final int categoryId;
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
  final String name;
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
  final double quantity;
  final int urgency;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "breed_plant_date")
  final breedPlantDate;
  @JsonKey(name: "target_harvest_sell")
  final targetHarvestSell;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
