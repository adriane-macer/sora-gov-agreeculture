import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyFarmState extends Equatable {
  MyFarmState([List props = const []]);
}

class MyFarmUninitialized extends MyFarmState {

  @override
  String toString() => 'MyFarmUninitialized';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class MyFarmLoading extends MyFarmState {

  @override
  String toString() => 'MyFarmLoading';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class MyFarmLoaded extends MyFarmState {

  @override
  String toString() => 'MyFarmLoaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class MyFarmError extends MyFarmState {

  final exception;

  MyFarmError(this.exception) : super([exception]);

  @override
  String toString() => 'MyFarmError';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class NoMyFarmLoaded extends MyFarmState {

  @override
  String toString() => 'No MyFarm Loaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

//TODO: Add states