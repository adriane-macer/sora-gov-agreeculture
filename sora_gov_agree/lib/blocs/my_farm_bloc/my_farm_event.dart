import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyFarmEvent extends Equatable {
  MyFarmEvent([List props = const []]);
}

class FetchMyFarm extends MyFarmEvent {
  @override
  String toString() => 'FetchMyFarm';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RefreshMyFarm extends MyFarmEvent {
  @override
  String toString() => 'RefreshMyFarm';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class AddProduct extends MyFarmEvent {
  final categoryId;
  final subcategoryId;
  final name;
  final city;
  final shortDescription;
  final breedPlantDate;
  final targetHarvestSellDate;

  AddProduct({this.categoryId, this.subcategoryId, this.name, this.city,
      this.shortDescription, this.breedPlantDate, this.targetHarvestSellDate});

  @override
  String toString() => 'AddProduct';

  @override
  // TODO: implement props
  List<Object> get props => null;
}
