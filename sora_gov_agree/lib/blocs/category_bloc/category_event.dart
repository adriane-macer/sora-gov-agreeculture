import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  CategoryEvent([List props = const []]);
}

class FetchCategory extends CategoryEvent {

  @override
  String toString() => 'FetchCategory';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RefreshCategory extends CategoryEvent {

  @override
  String toString() => 'RefreshCategory';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class AddCategory extends CategoryEvent {

  final name;
  final symbol;

  AddCategory(this.name, this.symbol);


  @override
  String toString() => 'AddCategory';

  @override
  // TODO: implement props
  List<Object> get props => null;
}