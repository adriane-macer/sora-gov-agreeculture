import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CropPricesEvent extends Equatable {
  CropPricesEvent([List props = const []]);
}

class FetchCropPrices extends CropPricesEvent {

  @override
  String toString() => 'FetchCropPrices';

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class RefreshCropPrices extends CropPricesEvent {

  @override
  String toString() => 'RefreshCropPrices';

  @override
  // TODO: implement props
  List<Object> get props => null;

}

//TODO: Add events