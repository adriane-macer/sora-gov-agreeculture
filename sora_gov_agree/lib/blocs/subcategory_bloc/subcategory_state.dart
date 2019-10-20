import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SubcategoryState extends Equatable {
  SubcategoryState([List props = const []]);
}

class SubcategoryUninitialized extends SubcategoryState {

  @override
  String toString() => 'SubcategoryUninitialized';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SubcategoryLoading extends SubcategoryState {

  @override
  String toString() => 'SubcategoryLoading';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SubcategoryLoaded extends SubcategoryState {

  @override
  String toString() => 'SubcategoryLoaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SubcategoryError extends SubcategoryState {

  final exception;

  SubcategoryError(this.exception) : super([exception]);

  @override
  String toString() => 'SubcategoryError';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class NoSubcategoryLoaded extends SubcategoryState {

  @override
  String toString() => 'No Subcategory Loaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

//TODO: Add states