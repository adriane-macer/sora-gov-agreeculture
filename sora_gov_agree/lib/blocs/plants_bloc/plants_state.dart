import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PlantsState extends Equatable {
  PlantsState([List props = const []]);
}

class PlantsUninitialized extends PlantsState {

  @override
  String toString() => 'PlantsUninitialized';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PlantsLoading extends PlantsState {

  @override
  String toString() => 'PlantsLoading';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PlantsLoaded extends PlantsState {

  @override
  String toString() => 'PlantsLoaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PlantsError extends PlantsState {

  final exception;

  PlantsError(this.exception) : super([exception]);

  @override
  String toString() => 'PlantsError';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class NoPlantsLoaded extends PlantsState {

  @override
  String toString() => 'No Plants Loaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

//TODO: Add states