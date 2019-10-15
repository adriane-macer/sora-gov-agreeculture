import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyFarmEvent extends Equatable {
  MyFarmEvent([List props = const []]);
}

class FetchMyFarm extends MyFarmEvent {

  @override
  String toString() => 'FetchMyFarm';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RefreshMyFarm extends MyFarmEvent {

  @override
  String toString() => 'RefreshMyFarm';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

//TODO: Add events