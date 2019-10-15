import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CropPricesState extends Equatable {
  CropPricesState([List props = const []]);
}

class CropPricesUninitialized extends CropPricesState {

  @override
  String toString() => 'CropPricesUninitialized';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CropPricesLoading extends CropPricesState {

  @override
  String toString() => 'CropPricesLoading';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CropPricesLoaded extends CropPricesState {

  @override
  String toString() => 'CropPricesLoaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CropPricesError extends CropPricesState {

  final exception;

  CropPricesError(this.exception) : super([exception]);

  @override
  String toString() => 'CropPricesError';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class NoCropPricesLoaded extends CropPricesState {

  @override
  String toString() => 'No CropPrices Loaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

//TODO: Add states