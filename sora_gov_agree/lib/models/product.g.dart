// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    category: json['category'] as int,
    subcategoryId: json['subcategory_id'] as int,
    userId: json['user_id'] as int,
    orgId: json['org_id'] as int,
    groupId: json['group_id'] as int,
    reference: json['reference'] as String,
    status: json['status'] as int,
    kind: json['kind'] as int,
    userPic: json['user_pic'] as String,
    userName: json['user_name'] as String,
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
    state: json['state'] as String,
    featured: json['featured'] as bool,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    deletedAt: json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String),
    gender: json['gender'] as int,
    email: json['email'] as String,
    mobile: json['mobile'] as String,
    provider: json['provider'] as String,
    uid: json['uid'] as String,
    logistics: json['logistics'] as int,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'category': instance.category,
      'subcategory_id': instance.subcategoryId,
      'user_id': instance.userId,
      'org_id': instance.orgId,
      'group_id': instance.groupId,
      'reference': instance.reference,
      'status': instance.status,
      'kind': instance.kind,
      'user_pic': instance.userPic,
      'user_name': instance.userName,
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
      'state': instance.state,
      'featured': instance.featured,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'gender': instance.gender,
      'email': instance.email,
      'mobile': instance.mobile,
      'provider': instance.provider,
      'uid': instance.uid,
      'logistics': instance.logistics,
    };
