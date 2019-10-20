import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SubcategoryEvent extends Equatable {
  SubcategoryEvent([List props = const []]);
}

class FetchSubcategory extends SubcategoryEvent {
  @override
  String toString() => 'FetchSubcategory';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RefreshSubcategory extends SubcategoryEvent {
  @override
  String toString() => 'RefreshSubcategory';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class AddSubcategory extends SubcategoryEvent {
  final name;
  final symbol;
  final categoryId;

  AddSubcategory(this.name, this.symbol, this.categoryId);

  @override
  String toString() => 'AddSubcategory';

  @override
  // TODO: implement props
  List<Object> get props => null;
}
