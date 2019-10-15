import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HelpEvent extends Equatable {
  HelpEvent([List props = const []]);
}

class FetchHelp extends HelpEvent {

  @override
  String toString() => 'FetchHelp';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RefreshHelp extends HelpEvent {

  @override
  String toString() => 'RefreshHelp';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

//TODO: Add events