import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PlantsEvent extends Equatable {
  PlantsEvent([List props = const []]) ;
}

class FetchPlants extends PlantsEvent {

  @override
  String toString() => 'FetchPlants';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RefreshPlants extends PlantsEvent {

  @override
  String toString() => 'RefreshPlants';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

//TODO: Add events