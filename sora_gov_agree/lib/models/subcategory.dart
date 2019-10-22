import 'package:json_annotation/json_annotation.dart';

part 'subcategory.g.dart';

@JsonSerializable()
class Subcategory {
  Subcategory(this.id, this.name, this.symbol, this.categoryId);

  final id;
  final name;
  final symbol;
  @JsonKey(name: "category_id")
  final categoryId;

  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
}
