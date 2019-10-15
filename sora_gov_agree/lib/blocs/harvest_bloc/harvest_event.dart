import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HarvestEvent extends Equatable {
  HarvestEvent([List props = const []]) ;
}

class FetchHarvest extends HarvestEvent {

  @override
  String toString() => 'FetchHarvest';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RefreshHarvest extends HarvestEvent {

  @override
  String toString() => 'RefreshHarvest';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

//TODO: Add events