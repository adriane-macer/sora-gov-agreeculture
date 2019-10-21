import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProductEvent extends Equatable {
  ProductEvent([List props = const []]);
}

class FetchProduct extends ProductEvent {

  @override
  String toString() => 'FetchProduct';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RefreshProduct extends ProductEvent {

  @override
  String toString() => 'RefreshProduct';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

//TODO: Add events