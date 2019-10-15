import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HelpState extends Equatable {
  HelpState([List props = const []]);
}

class HelpUninitialized extends HelpState {
  @override
  String toString() => 'HelpUninitialized';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class HelpLoading extends HelpState {
  @override
  String toString() => 'HelpLoading';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class HelpLoaded extends HelpState {
  @override
  String toString() => 'HelpLoaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class HelpError extends HelpState {
  final exception;

  HelpError(this.exception) : super([exception]);

  @override
  String toString() => 'HelpError';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class NoHelpLoaded extends HelpState {
  @override
  String toString() => 'No Help Loaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

//TODO: Add states
