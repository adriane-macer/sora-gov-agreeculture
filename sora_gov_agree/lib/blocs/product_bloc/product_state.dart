import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProductState extends Equatable {
  ProductState([List props = const []]);
}

class ProductUninitialized extends ProductState {
  @override
  String toString() => 'ProductUninitialized';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ProductLoading extends ProductState {
  @override
  String toString() => 'ProductLoading';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ProductLoaded extends ProductState {
  @override
  String toString() => 'ProductLoaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ProductError extends ProductState {
  final exception;

  ProductError(this.exception) : super([exception]);

  @override
  String toString() => 'ProductError';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class NoProductLoaded extends ProductState {
  @override
  String toString() => 'No Product Loaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

//TODO: Add states
