import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CategoryState extends Equatable {
  CategoryState([List props = const []]);
}

class CategoryUninitialized extends CategoryState {

  @override
  String toString() => 'CategoryUninitialized';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CategoryLoading extends CategoryState {

  @override
  String toString() => 'CategoryLoading';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CategoryLoaded extends CategoryState {

  @override
  String toString() => 'CategoryLoaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CategoryError extends CategoryState {

  final exception;

  CategoryError(this.exception) : super([exception]);

  @override
  String toString() => 'CategoryError';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class NoCategoryLoaded extends CategoryState {

  @override
  String toString() => 'No Category Loaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

//TODO: Add states