import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HarvestState extends Equatable {
  HarvestState([List props = const []]) ;
}

class HarvestUninitialized extends HarvestState {

  @override
  String toString() => 'HarvestUninitialized';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class HarvestLoading extends HarvestState {

  @override
  String toString() => 'HarvestLoading';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class HarvestLoaded extends HarvestState {

  @override
  String toString() => 'HarvestLoaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class HarvestError extends HarvestState {

  final exception;

  HarvestError(this.exception) : super([exception]);

  @override
  String toString() => 'HarvestError';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class NoHarvestLoaded extends HarvestState {

  @override
  String toString() => 'No Harvest Loaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

//TODO: Add states