// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    categoryId: json['category_id'] as int,
    subcategoryId: json['subcategory_id'] as int,
    userId: json['user_id'] as int,
    orgId: json['org_id'] as int,
    groupId: json['group_id'] as int,
    reference: json['reference'] as String,
    status: json['status'] as int,
    kind: json['kind'] as int,
    userPic: json['user_pic'] as String,
    userName: json['user_name'] as String,
    name: json['name'] as String,
    nameEn: json['name_en'] as String,
    nameLocal: json['name_local'] as String,
    photo: json['photo'] as String,
    address: json['address'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    province: json['province'] as String,
    city: json['city'] as String,
    district: json['district'] as String,
    shortDescription: json['short_description'] as String,
    shortDescriptionEn: json['short_description_en'] as String,
    link: json['link'] as String,
    sustainabilityRating: json['sustainability_rating'] as int,
    impressionsCount: json['impressions_count'] as int,
    terms: json['terms'] as String,
    measure: json['measure'] as String,
    paymentClass: json['payment_class'] as int,
    currency: json['currency'] as String,
    currencyPrice: (json['currency_price'] as num)?.toDouble(),
    maximumPrice: (json['maximum_price'] as num)?.toDouble(),
    minimumPrice: (json['minimum_price'] as num)?.toDouble(),
    quantity: (json['quantity'] as num)?.toDouble(),
    urgency: json['urgency'] as int,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'category_id': instance.categoryId,
      'subcategory_id': instance.subcategoryId,
      'user_id': instance.userId,
      'org_id': instance.orgId,
      'group_id': instance.groupId,
      'reference': instance.reference,
      'status': instance.status,
      'kind': instance.kind,
      'user_pic': instance.userPic,
      'user_name': instance.userName,
      'name': instance.name,
      'name_en': instance.nameEn,
      'name_local': instance.nameLocal,
      'photo': instance.photo,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'province': instance.province,
      'city': instance.city,
      'district': instance.district,
      'short_description': instance.shortDescription,
      'short_description_en': instance.shortDescriptionEn,
      'link': instance.link,
      'sustainability_rating': instance.sustainabilityRating,
      'impressions_count': instance.impressionsCount,
      'terms': instance.terms,
      'measure': instance.measure,
      'payment_class': instance.paymentClass,
      'currency': instance.currency,
      'currency_price': instance.currencyPrice,
      'maximum_price': instance.maximumPrice,
      'minimum_price': instance.minimumPrice,
      'quantity': instance.quantity,
      'urgency': instance.urgency,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
